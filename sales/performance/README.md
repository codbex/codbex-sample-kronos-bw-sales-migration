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
