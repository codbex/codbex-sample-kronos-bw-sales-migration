import { initializeABAP } from '../dist/init.mjs';
import { cl_runner } from '../dist/cl_runner.clas.mjs';
import { getLogger } from "sales/etl/logger-util";

const logger = getLogger(import.meta.url);

export async function transformEntries(transformationId, entities) {
  logger.debug("Initializing ABAP code...");
  await initializeABAP();
  logger.debug("ABAP has been initialized.");

  const entitiesJson = JSON.stringify(entities);
  const abapEntitiesJson = new abap.types.String().set(entitiesJson);
  const abapTransformationId = new abap.types.String().set(transformationId);

  const params = {
    source_json: abapEntitiesJson,
    transformation: abapTransformationId
  };

  logger.debug("Executing ABAP code...");

  const result = await cl_runner.transform(params);
  logger.debug("Transpiled ABAP code has been executed.");

  return JSON.parse(result.get());
} 
