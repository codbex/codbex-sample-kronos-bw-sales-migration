# Overview
A folder used for transformations performance testing

## Structure
- `source-entries` folder<br>
    [source-entries](source-entries) contains json files with source entries for the different transformations.
    The content is exported during a BPM process execution.
    All file names use the following pattern `<source_table>-<transformation-id>`

- `perf-test-kronos.ts` file used for Kronos env testing
The file **uses** Kronos sdk libraries.

- `perf-test-hardcoded.ts` file used for testing **without** Kronos sdk libraries

## Testing

### [WIP] nodejs using bundled file
The following commands needs to be executed in a Kronos docker container.

__Prerequisites__
- Clone the project in kronos
- Publish it
- Execute the following
```shell
#cd /target/dirigible/repository/root/registry/public/sales

cd /target/dirigible/repository/.git/admin/workspace/codbex-sample-kronos-bw-sales-migration/sales

# copy ORAS artifacts
rm -rf oras-artifacts
mkdir -p oras-artifacts
cp -r /opt/codbex/oras-artifacts/. ./oras-artifacts/

rm -rf node_modules

npm ci
npm run transpile

node run.mjs

node ./performance/perf-test-nodejs-bundled.mjs
```

### [WIP] nodejs directly using transpiled files
The following commands needs to be executed in a Kronos docker container.

__Prerequisites__
- Clone the project in kronos
- Publish it
- Execute the following
```shell
cd /target/dirigible/repository/.git/admin/workspace/codbex-sample-kronos-bw-sales-migration/sales

# copy ORAS artifacts
rm -rf oras-artifacts
mkdir -p oras-artifacts
cp -r /opt/codbex/oras-artifacts/. ./oras-artifacts/

rm -rf node_modules

npm ci
npm run transpile

node ./performance/perf-test-nodejs-direct.mjs
```

### GraalVM profiling tools
Official documentation [here](https://www.graalvm.org/latest/tools/profiling/). Related blog [here](https://medium.com/graalvm/where-has-all-my-run-time-gone-245f0ccde853)<br>
All examples use `js` graalvm launcher which could be installed using `gu` (GraalVM Updater) tool.
`gu` tools is available in **GraalVM 17** but **not in the newer versions** like 21 and 24.
To install the launcher:
- Download GraalVM 17 from [here](https://www.graalvm.org/downloads) which leads to the oracle site [here](https://www.oracle.com/java/technologies/downloads/#graalvmjava17)
- Unzip the file
- Go to `bin` dir and execute `./gu install js`
- It requires token and license agreement which will be by Oracle to your email
- On successful installation, `js` launcher will be installed in the `bin` folder
- Try the examples from the [profiling](https://www.graalvm.org/latest/tools/profiling/) site to ensure the tool works
- To test the transformation logic unzip the test code from [sales.zip](sales.zip)
  The zip contains the files exported from the Dirigible registry. Bundled file `abap-transformation-executor.mjs` has commented the line `var types_1 = __require("util/types");` in order to work
- Play with the tools. Examples:
```shell
GRAAL_HOME='<path>/graalvm-jdk-17.0.16+12.1/Contents/Home'
export PATH="$GRAAL_HOME/bin:$PATH"

cd sales/performance
js perf-test-hardcoded.mjs

# where the time is spent to the console
js --cpusampler perf-test-hardcoded.mjs

# where the time is spent in flamegraph
js --cpusampler=flamegraph  perf-test-hardcoded.mjs

# calltree
js --cpusampler --cpusampler.Output=calltree  perf-test-hardcoded.mjs

#  collect execution counts of each statement:
js perf-test-hardcoded.mjs --cputracer --cputracer.TraceStatements

```
