import { IntegrationMessage } from "sdk/integrations"
import { getLogger } from "sales/etl/logger-util";
import { extractEntries } from "sales/etl/etl";

const logger = getLogger(import.meta.url);

export function onMessage(message: IntegrationMessage) {
    logger.debug("Executing logic...");

    const sourceTable = message.getExchangeProperty('sourceTable');
    const entries = extractEntries(sourceTable);
    message.setBody(entries);

    logger.debug("Step completed.");

    return message;
}

