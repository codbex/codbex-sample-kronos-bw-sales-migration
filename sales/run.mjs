import { initializeABAP } from './dist/init.mjs';
import { cl_runner } from './dist/cl_runner.clas.mjs';

console.log("Initializing ABAP code...");
await initializeABAP();
console.log("ABAP has been initialized.");

const rows = [];
for (let index = 0; index < 60000; index++) {
  rows.push(`{
    "PRODUCTFK": 2,
    "CUSTOMERFK": 2,
    "PROMOTIONFK": 2,
    "CURRENCYFK": 2,
    "CURRENCY": "EUR",
    "SALETERRITORYFK": 2,
    "SALESORDERNUMBER": "${(index + "").padStart(7, "0")}",
    "SALESORDERLINENU": 10,
    "ORDERQUANTITY": 2,
    "DISCOUNTAMOUNT": 2,
    "TOTALPRODUCTCOST": 2,
    "SALESAMOUNT": 2,
    "TAXAMOUNT": 2,
    "FREIGHT": "HELLO",
    "ORDERDATE": "20250626",
    "DUEDATE": "20250626",
    "SHIPDATE": "20250626",
    "SALEFLAG": "AB"
}`);
}

const json = `[\n${rows.join(",\n")}]`;

console.log("Executing ABAP code...");
const t0 = performance.now();
const result = await cl_runner.transform_v2({
  settings: new abap.types.Structure({trace: new abap.types.Character().set("X")}),
  program: new abap.types.String().set(`gp0ouy6jznkdgx433nt82k6s7yn`),
  source_json: new abap.types.String().set(json)});
const t1 = performance.now();

console.log(`Result:`);
const parsed = JSON.parse(result.get().target_json.get());
if (parsed.length < 10) {
  console.dir(parsed);
}
console.log(parsed.length + ` records mapped in ${Math.round(t1 - t0)}ms`);;

