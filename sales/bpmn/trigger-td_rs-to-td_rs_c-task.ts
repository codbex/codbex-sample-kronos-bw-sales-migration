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
    "sourceTable": "TD_RS",
    "targetTable": "TD_RS_C",
    "transformationId": "0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N" // gp0ouy6jznkdgx433rub7z8mklj.prog.abap
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", ETL_ROUTE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(ETL_ROUTE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", ETL_ROUTE_CAMEL_URI, outputBody);


