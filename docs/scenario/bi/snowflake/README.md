# BI on Snowflake
Export/import procedure for the scenario tables content on Snowflake.
The tables data represents the state after the scenario execution.
Described procedure is used for testing on snowflake accounts.

<!-- TOC -->
* [BI on Snowflake](#bi-on-snowflake)
  * [Export data to stage](#export-data-to-stage)
  * [Download stage files](#download-stage-files)
    * [Using snowsql tool](#using-snowsql-tool)
    * [Using snowflake UI (snowsight)](#using-snowflake-ui-snowsight)
<!-- TOC -->

## Export data to stage

__Prerequisites__
```shell
GIT_DIR='/Users/iliyan/work/git/codbex-sample-kronos-bw-sales-migration'
WORK_DIR="$GIT_DIR/docs/scenario/bi/snowflake"

CONNECTION_NAME='bi'
SNOW_USER='bw_migration_bi_admin'
```

- Add snow CLI connection with name `bi` to Kronos schema in file `~/Library/Application Support/snowflake/config.toml`
  Example config:
```yaml
[connections.bi]
account = "jiixfdf-bw_migration_bi"
user = "<pass>"
password = "<pass>"
database = "KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS"
schema = "KRONOS_DEFAULTDB"
warehouse = "KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS_WAREHOUSE"
role = "BI_ROLE"
```

- Test the connection
```shell
snow sql -q "SELECT 1" -c "$CONNECTION_NAME"
```

- Temp disable MFA
```shell
snow sql -q "ALTER USER $SNOW_USER SET MINS_TO_BYPASS_MFA=800;" -c $CONNECTION_NAME
```

- List all schema tables
```shell
cd "$WORK_DIR"
snow sql -q "SHOW TABLES IN SCHEMA KRONOS_DEFAULTDB;" -c $CONNECTION_NAME --format JSON > tables.json
```

- Create stage for the files
    ```sql
    USE ROLE ACCOUNTADMIN;
    CREATE DATABASE KRONOS_EXPORT_DB;
    USE DATABASE KRONOS_EXPORT_DB;
    
    CREATE OR REPLACE STAGE bw_bi_stage;
    ```

- Export tables data<br>
    For each table in `tables.json` file:
  - Export to stage
    ```sql
    -- table /BIC/PMD_CUS to file BIC-PMD_CUS
    COPY INTO @bw_bi_stage/tables-data/BIC-PMD_CUS
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/PMD_CUS"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/PMD_DP_GR to file BIC-PMD_DP_GR
    COPY INTO @bw_bi_stage/tables-data/BIC-PMD_DP_GR
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/PMD_DP_GR"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/PMD_EMP to file BIC-PMD_EMP
    COPY INTO @bw_bi_stage/tables-data/BIC-PMD_EMP
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/PMD_EMP"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/PMD_PR_SC to file BIC-PMD_PR_SC
    COPY INTO @bw_bi_stage/tables-data/BIC-PMD_PR_SC
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/PMD_PR_SC"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/PMD_RS to file BIC-PMD_RS
    COPY INTO @bw_bi_stage/tables-data/BIC-PMD_RS
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/PMD_RS"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/PMD_S_TY to file BIC-PMD_S_TY
    COPY INTO @bw_bi_stage/tables-data/BIC-PMD_S_TY
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/PMD_S_TY"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/QMD_PROM to file BIC-QMD_PROM
    COPY INTO @bw_bi_stage/tables-data/BIC-QMD_PROM
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/QMD_PROM"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_CURR to file BIC-TMD_CURR
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_CURR
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_CURR"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_CUS to file BIC-TMD_CUS
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_CUS
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_CUS"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_DP_GR to file BIC-TMD_DP_GR
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_DP_GR
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_DP_GR"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_EMP to file BIC-TMD_EMP
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_EMP
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_EMP"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_PROD to file BIC-TMD_PROD
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_PROD
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_PROD"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_PROM to file BIC-TMD_PROM
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_PROM
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_PROM"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_PR_CG to file BIC-TMD_PR_CG
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_PR_CG
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_PR_CG"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_PR_SC to file BIC-TMD_PR_SC
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_PR_SC
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_PR_SC"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_RS to file BIC-TMD_RS
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_RS
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_RS"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table /BIC/TMD_S_TY to file BIC-TMD_S_TY
    COPY INTO @bw_bi_stage/tables-data/BIC-TMD_S_TY
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."/BIC/TMD_S_TY"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
  
    -- table DS_IS_TD to file DS_IS_TD
    COPY INTO @bw_bi_stage/tables-data/DS_IS_TD
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."DS_IS_TD"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table DS_RS_TD to file DS_RS_TD
    COPY INTO @bw_bi_stage/tables-data/DS_RS_TD
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."DS_RS_TD"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table TD_IS to file TD_IS
    COPY INTO @bw_bi_stage/tables-data/TD_IS
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."TD_IS"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table TD_IS_C to file TD_IS_C
    COPY INTO @bw_bi_stage/tables-data/TD_IS_C
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."TD_IS_C"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
  
    -- table TD_RS to file TD_RS
    COPY INTO @bw_bi_stage/tables-data/TD_RS
    FROM KRONOS__COMPATIBLE_PLATFORM_FOR_SAP_ABAP__HANA_XS.KRONOS_DEFAULTDB."TD_RS"
    FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' COMPRESSION = GZIP)
    OVERWRITE = TRUE;
    ```

## Download stage files

### Using snowsql tool
- Install snowsql from [here](https://docs.snowflake.com/en/user-guide/snowsql-install-config)
- Configure connection with name `export` to the stage location in config file `~/.snowsql/config`
  Example:
```yaml
[connections.export]

accountname = jiixfdf-bw_migration_bi
username = <user>
password = <pass>
dbname = KRONOS_EXPORT_DB
schemaname = PUBLIC
warehousename = SYSADMIN_X_SMALL
rolename = ACCOUNTADMIN
```
- Download stage files
```shell
cd "$WORK_DIR"
rm -rf ./data
mkdir ./data

snowsql -q "GET @bw_bi_stage/tables file://./data" --connection export
```

### Using snowflake UI (snowsight)
- Go to the stage
- Download each file line by one


## Import data into Snowflake account
### Create tables
```sql

```
