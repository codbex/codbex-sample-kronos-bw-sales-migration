import { process } from "sdk/bpm"
import { Integrations } from "sdk/integrations"
import { getLogger } from "sales/etl/logger-util";

const logger = getLogger(import.meta.url);

const DSO_TO_CUBE_CAMEL_URI = 'direct:dso-to-cube';

const execution = process.getExecutionContext();
const processInstanceId = execution.getProcessInstanceId();

const inputBody = '';
const headers = {};
const exchangeProperties = {
    "sourceTable": "TD_RS",
    "targetTable": "TD_RS_C",
    "transformationId": "0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N"
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", DSO_TO_CUBE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(DSO_TO_CUBE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", DSO_TO_CUBE_CAMEL_URI, outputBody);


