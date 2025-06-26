import { process } from "sdk/bpm"
import { getLogger } from "sales/etl/logger-util";

const logger = getLogger(import.meta.url);

const execution = process.getExecutionContext();
const processInstanceId = execution.getProcessInstanceId();

logger.info("Process instance with id [{}] has completed!", processInstanceId);
