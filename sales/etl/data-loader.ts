import { getLogger } from "sales/etl/logger-util";
import { loadEntries } from "sales/etl/etl";

const logger = getLogger(import.meta.url);

export function onMessage(message: any) {
  logger.debug("Executing logic...");

  const targetTable = message.getExchangeProperty('targetTable');
  const transformedEntries = message.getBody();
  loadEntries(targetTable, transformedEntries);

  logger.debug("Step completed.");
  return message;
}
