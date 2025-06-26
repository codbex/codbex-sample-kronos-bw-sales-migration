import { process } from "sdk/bpm"
import { Integrations } from "sdk/integrations"
import { getLogger } from "sales/etl/logger-util";

const logger = getLogger(import.meta.url);

const ETL_ROUTE_CAMEL_URI = 'direct:etl-route';

const execution = process.getExecutionContext();
const processInstanceId = execution.getProcessInstanceId();

const inputBody = '';
const headers = {};
const exchangeProperties = {
    "sourceTable": "DS_IS_TD",
    "targetTable": "TD_IS",
    "transformationId": "0F6HG21PA0TK50C7KN4GA0325H9G7YOH" // gp0ouy6jznkdgx433nt82k6s7yn.prog.abap
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", ETL_ROUTE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(ETL_ROUTE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", ETL_ROUTE_CAMEL_URI, outputBody);


