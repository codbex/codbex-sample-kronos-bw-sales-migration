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
    "sourceTable": "DS_IS_TD",
    "targetTable": "TD_IS",
    "transformationId": "0F6HG21PA0TK50C7KN4GA0325H9G7YOH"
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", DSO_TO_CUBE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(DSO_TO_CUBE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", DSO_TO_CUBE_CAMEL_URI, outputBody);


