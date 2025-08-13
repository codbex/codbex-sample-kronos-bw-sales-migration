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
