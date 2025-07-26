import { initializeABAP } from '../dist/init.mjs';
import { cl_runner } from '../dist/cl_runner.clas.mjs';
import { getLogger } from "sales/etl/logger-util";

const logger = getLogger(import.meta.url);

export async function transformEntries(transformationId, entities) {
  logger.debug("Initializing ABAP code...");
  await initializeABAP();
  logger.debug("ABAP has been initialized.");

  const transformations = {
   "0TV24F1JY884H1C30RDIC36ST131L5UT": "gp0ouy6jznkdgx433ra0z880bxz",
   "0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N": "gp0ouy6jznkdgx433rub7z8mklj",
   "0FLXDSKYMZALJXUYFY6L5K61AVNABJMC": "gp0ouy6jznkdgx433qjqtxxmn0e",
   "0F6HG21PA0TK50C7KN4GA0325H9G7YOH": "gp0ouy6jznkdgx433nt82k6s7yn",
  };

  const entitiesJson = JSON.stringify(entities);
  const abapEntitiesJson = new abap.types.String().set(entitiesJson);
  const program = new abap.types.String().set(transformations[transformationId]);

  const params = {
//    settings: new abap.types.Structure({trace: new abap.types.Character().set("X")}),
    source_json: abapEntitiesJson,
    program: program
  };

  logger.debug("Executing ABAP code...");

  const result = await cl_runner.transform_v2(params);
  logger.debug("Transpiled ABAP code has been executed.");

  return JSON.parse(result.get());
}
