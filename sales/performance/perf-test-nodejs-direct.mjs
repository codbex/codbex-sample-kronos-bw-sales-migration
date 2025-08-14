import { initializeABAP } from '../dist/init.mjs';
import { cl_runner } from '../dist/cl_runner.clas.mjs';
import * as fs from 'fs';


const transformationId = "0F6HG21PA0TK50C7KN4GA0325H9G7YOH";
const sourceEntries = loadSourceEntries();

await performTransformation(transformationId, sourceEntries);

console.log(`perf-test-nodejs-direct.mjs completed!`);


// should be the same as the one defined in perf.ts
async function performTransformation(transformationId, entries) {

  console.log(`Executing performance testing of ${entries.length} entries using transformation with id ${transformationId}`);

  const startTime = Date.now();

  // -----
  console.log("Initializing ABAP code...");
  await initializeABAP();
  console.log("ABAP has been initialized.");

  const entitiesJson = JSON.stringify(entries);
  const abapEntitiesJson = new abap.types.String().set(entitiesJson);
  const abapTransformationId = new abap.types.String().set(transformationId);

  const params = {
    source_json: abapEntitiesJson,
    transformation: abapTransformationId
  };

  console.log("Executing ABAP code...");

  const result = await cl_runner.transform(params);
  console.log("Transpiled ABAP code has been executed.");

  const transformedEntries = JSON.parse(result.get());
  // -----

  const endTime = Date.now();

  const transformationMillis = (endTime - startTime);
  console.log(`Transformation of ${entries.length} entries to ${transformedEntries.length} using transformation ${transformationId} took ${transformationMillis}ms`);
}

function loadSourceEntries() {
  const json = get0F6HG21PA0TK50C7KN4GA0325H9G7YOHEntries();
  return JSON.parse(json);
}

function get0F6HG21PA0TK50C7KN4GA0325H9G7YOHEntries() {
  const filePath = "/target/dirigible/repository/.git/admin/workspace/codbex-sample-kronos-bw-sales-migration/sales/performance/source-entries/DS_IS_TD-0F6HG21PA0TK50C7KN4GA0325H9G7YOH.json";
  //   const filePath = "/Users/iliyan/work/dirigible-workspaces/kronos/dirigible/repository/.git/admin/workspace/codbex-sample-kronos-bw-sales-migration/sales/performance/source-entries/DS_IS_TD-0F6HG21PA0TK50C7KN4GA0325H9G7YOH.json";

  try {
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
  } catch (err) {
    if (err instanceof Error) {
      console.error('Error reading file:', err.message);
      throw err;
    } else {
      console.error('Unknown error:', err);
      throw err;
    }
  }
}
