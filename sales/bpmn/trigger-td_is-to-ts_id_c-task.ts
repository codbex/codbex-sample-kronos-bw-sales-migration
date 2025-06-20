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
    "sourceTable": "TD_IS",
    "targetTable": "TD_IS_C",
    "transformationId": "0TV24F1JY884H1C30RDIC36ST131L5UT"
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", DSO_TO_CUBE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(DSO_TO_CUBE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", DSO_TO_CUBE_CAMEL_URI, outputBody);


