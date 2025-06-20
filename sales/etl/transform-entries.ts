import { transformEntries } from "sales/etl/etl";
import { getLogger } from "sales/etl/logger-util";

const logger = getLogger(import.meta.url);

export async function onMessage(message: any) {
    logger.debug("Executing logic...");

    const transformationId = message.getExchangeProperty('transformationId');
    const sourceEntries = message.getBody();

    const transformedEntries = await transformEntries(transformationId, sourceEntries);
    message.setBody(transformedEntries);

    logger.debug("Step completed.");

    return message;
}
