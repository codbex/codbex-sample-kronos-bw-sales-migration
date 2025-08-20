import { initializeABAP } from '../dist/init.mjs';
import { cl_runner } from '../dist/cl_runner.clas.mjs';

export async function transformEntries(transformationId, entities) {
  console.log("Initializing ABAP code...");
  await initializeABAP();
  console.log("ABAP has been initialized.");

  const entitiesJson = JSON.stringify(entities);
  const abapEntitiesJson = new abap.types.String().set(entitiesJson);
  const abapTransformationId = new abap.types.String().set(transformationId);

  const params = {
    source_json: abapEntitiesJson,
    transformation: abapTransformationId
  };

  console.log("Executing ABAP code...");

  const result = await cl_runner.transform(params);
  console.log("Transpiled ABAP code has been executed.");

  return JSON.parse(result.get());
} 
