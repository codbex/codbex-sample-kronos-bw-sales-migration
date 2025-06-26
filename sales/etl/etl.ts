import { getLogger } from "sales/etl/logger-util";
import { prettyPrintJson } from "sales/etl/json-util";
import { transformEntries as abapTransformEntries } from "/sales/dist/abap-transformation-executor.mjs";
import { sql, query, update, insert } from "sdk/db";

const ABAP_DATE_FORMAT = 'yyyyMMdd';
const INSERT_BATCH_SIZE = 1000;

const logger = getLogger(import.meta.url);

export function extractEntries(tableName: string): any[] {
    return logExecutionTime("Entries extraction took [{}]ms", () => {

        const sqlScript = sql.getDialect()
            .select()
            .from(tableName)
            .build();

        const resultParameters = {
            dateFormat: ABAP_DATE_FORMAT
        };

        const entries = query.execute(sqlScript, undefined, undefined, resultParameters);

        logger.info("Extraction of [{}] entries from table [{}] completed", entries.length, tableName);
        logger.debug("Extracted entries:\n{}", prettyPrintJson(entries));

        return entries;
    });
}

export async function transformEntries(transformationId: string, sourceEntries: any[]) {
    return logExecutionTime("Entries transformation took [{}]ms", async () => {
        logger.debug("[{}] entries need to be transformed using transformation with id [{}].", sourceEntries.length, transformationId);
        logger.debug("Entries to be transformed:\n{}", prettyPrintJson(sourceEntries));

        const transformedEntries = await abapTransformEntries(transformationId, sourceEntries);

        logger.info("Transformation of [{}] entries to [{}] using transformation with id [{}] completed", sourceEntries.length, transformedEntries.length, transformationId);
        logger.debug("Entries:\n{}\nwere transformed to\n{}", prettyPrintJson(sourceEntries), prettyPrintJson(transformedEntries));

        return transformedEntries;
    });
}

export function loadEntries(tableName: string, entries: any[]) {
    return logExecutionTime("Entries load took [{}]ms", () => {

        deleteAllFromTableTable(tableName);

        const preparedEntries = prepareEntries(entries);
        insertIntoTargetTable(tableName, preparedEntries);

        logger.info("Insertion of [{}] entries into table [{}] completed", preparedEntries.length, tableName);
    });
}

function deleteAllFromTableTable(tableName: string) {
    logger.info("Deleting all entries from table [{}]...", tableName);
    const sqlScript = sql.getDialect()//
        .delete()//
        .from(tableName)//
        .build();
    update.execute(sqlScript);
}

function prepareEntries(entries: any[]) {
    const skippedMembers = ['RECORD', 'CHNGID', 'RECORDTP', 'REQUID', 'SID', 'DATAPAKID', 'RECORDMODE'];

    const preparedEntries = entries.map(entry => {
        return Object.entries(entry).reduce((acc, [key, value]) => {
            // Skip unwanted keys
            if (skippedMembers.includes(key)) {
                return acc;
            }

            acc[key] = value;
            return acc;
        }, {} as Record<string, any>);
    });

    return preparedEntries
}

function insertIntoTargetTable(tableName: string, entries: any[]) {
    logger.debug("[{}] entries have to be upserted into the target.", entries.length);
    logger.debug("Entries:\n{}", prettyPrintJson(entries));

    if (entries.length === 0) {
        logger.debug("No entries for insert");
        return;
    }

    const insertSql = createInsertSQL(tableName, entries);

    for (let i = 0; i < entries.length; i += INSERT_BATCH_SIZE) {
        const entriesBatch = entries.slice(i, i + INSERT_BATCH_SIZE);

        const batchValues: any[][] = [];

        // add entry values
        for (const entry of entriesBatch) {
            const entryValues = Object.values(entry);
            batchValues.push(entryValues);
        }

        try {
            const startTime = Date.now();
            insert.executeMany(insertSql, batchValues);
            const endTime = Date.now();
            logger.info("Insert of [{}] entries took [{}] millis", batchValues.length, (endTime - startTime));
        } catch (e) {
            logger.error("Failed to insert entries in table [{}] using sql [{}]. Entries:\n{}", tableName, insertSql, prettyPrintJson(entriesBatch));
            throw e;
        }
    }
}

function createInsertSQL(tableName: string, entries: any[]) {
    const builder = sql.getDialect()//
        .insert()//
        .into(tableName);

    const columns: any[] = Object.keys(entries.at(0));

    // add columns
    columns.forEach(column => {
        builder.column(column)
    });

    return builder.build();
}

function logExecutionTime<T>(messagePattern: string, fn: () => T): T {
    const startTime = Date.now();
    const result = fn();

    if (result instanceof Promise) {
        return result.catch((e) => {
            logger.error("Failed to execute code. Error: {}", e);
            throw e;
        }).finally(() => {
            const endTime = Date.now();
            logger.info(messagePattern, (endTime - startTime));
        }) as T;
    } else {
        const endTime = Date.now();
        logger.info(messagePattern, (endTime - startTime));
        return result;
    }
}
