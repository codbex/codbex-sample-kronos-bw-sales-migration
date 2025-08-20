import { performTransformation } from "sales/performance/perf";
import { files } from "sdk/io";

// trigger the file execution at http://localhost/services/ts/sales/performance/perf-test-kronos.ts

const baseDir = "/target/dirigible/repository/.git/admin/workspace/codbex-sample-kronos-bw-sales-migration/sales/performance/source-entries/";
// const baseDir = "/Users/iliyan/work/dirigible-workspaces/kronos/dirigible/repository/.git/admin/workspace/codbex-sample-kronos-bw-sales-migration/sales/performance/source-entries/";

const jsonFiles = {
    "0F6HG21PA0TK50C7KN4GA0325H9G7YOH": baseDir + "DS_IS_TD-0F6HG21PA0TK50C7KN4GA0325H9G7YOH.json",
    "0FLXDSKYMZALJXUYFY6L5K61AVNABJMC": baseDir + "DS_RS_TD-0FLXDSKYMZALJXUYFY6L5K61AVNABJMC.json",
    "0TV24F1JY884H1C30RDIC36ST131L5UT": baseDir + "TD_IS-0TV24F1JY884H1C30RDIC36ST131L5UT.json",
    "0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N": baseDir + "TD_RS-0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N.json"
};


const transformationId = "0F6HG21PA0TK50C7KN4GA0325H9G7YOH";
// const transformationId = "0FLXDSKYMZALJXUYFY6L5K61AVNABJMC";
// const transformationId = "0TV24F1JY884H1C30RDIC36ST131L5UT";
// const transformationId = "0O3HV2JF3M5P7LJO52ZNFFDYZJS0FJ7N";

const sourceEntries = loadSourceEntries(transformationId);
await performTransformation(transformationId, sourceEntries);

console.log(`perf-test-kronos.ts completed!`);

function loadSourceEntries(transformationId: string) {
    const filePath = jsonFiles[transformationId];
    if (!files.exists(filePath)) {
        throw new Error(`Missing file with path ${filePath}`);
    }
    const fileContent = files.readText(filePath);
    return JSON.parse(fileContent);
}
