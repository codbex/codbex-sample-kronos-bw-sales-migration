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
    "sourceTable": "DS_RS_TD",
    "targetTable": "TD_RS",
    "transformationId": "0FLXDSKYMZALJXUYFY6L5K61AVNABJMC" // gp0ouy6jznkdgx433qjqtxxmn0e.prog.abap
};

logger.info("Invoking route [{}] for process instance with id [{}] using exchange properties {}...", ETL_ROUTE_CAMEL_URI, processInstanceId, exchangeProperties);
const outputBody = Integrations.invokeRoute(ETL_ROUTE_CAMEL_URI, inputBody, headers, exchangeProperties);

logger.info("Route [{}] completed. Body [{}]", ETL_ROUTE_CAMEL_URI, outputBody);


