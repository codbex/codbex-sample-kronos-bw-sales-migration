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
    "sourceTable": "DS_RS_TD",
    "targetTable": "TD_RS",
    "transformationId": "0FLXDSKYMZALJXUYFY6L5K61AVNABJMC"
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", DSO_TO_CUBE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(DSO_TO_CUBE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", DSO_TO_CUBE_CAMEL_URI, outputBody);


