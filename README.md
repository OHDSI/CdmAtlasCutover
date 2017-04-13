# CdmAtlasCutover

## Introduction

This R package is designed to support the management of multiple CDM sources in Atlas. CDM sources can be removed, prepared for release, and released using this package.

## Features

- Remove CDM sources from Ohdsi Repository Schema
  - Remove records in Ohdsi Repository's SOURCE and SOURCE_DAIMON tables
  - Clear Atlas cohort assets for the sources to be remvoed
- Prepare CDM sources for release
  - Create tables in results database schema that Atlas requires
    - Cohort inclusion tables
    - Heracles tables
    - Feasibility tables
    - IR tables
- Add sources to Ohdsi Repository Schema
  - Add records to SOURCE and SOURCE_DAIMON tables
  - Specify if source is to be set at high priority
- Refresh sources in WebAPI to reflect changes in SOURCE and SOURCE_DAIMON
- Code can be executed through the package or written to SQL files for manual execution
- Written using OHDSql, so should work in Oracle, Postgres, Redshift, SQL Server, and PDW.

## Examples

```r
oldCdmSources <- list(
  buildCdmSource(sourceKey = "TestDb_V123", sourceName = "Test Database v123", dbms = "redshift", cdmDatabaseSchema = "cdm",
    resultsDatabaseSchema = "ohdsi_results", vocabDatabaseSchema = "cdm", priority = 1,
    connectionString = "jdbc:redshift://some-redshift-cluster:5439/testdb_v123?user=some-user&password=some-password")
  )
  
newCdmSources <- list(
  buildCdmSource(sourceKey = "TestDb_V456", sourceName = "Test Database v456", dbms = "redshift", cdmDatabaseSchema = "cdm",
    resultsDatabaseSchema = "ohdsi_results", vocabDatabaseSchema = "cdm", priority = 1,
    connectionString = "jdbc:redshift://some-redshift-cluster:5439/testdb_v456?user=some-user&password=some-password")
  )

## remove old version of a CDM data source  
removeCdmSources(repoConnectionDetails = repoConnectionDetails, cdmSources = oldCdmSources, sqlOnly = TRUE)

## prepare new CDM data source by ensuring all necessary tables are available
createOhdsiResultsTables(cdmSources = newCdmSources, sqlOnly = TRUE)

## add new CDM data source
insertCdmSources(repoConnectionDetails = repoConnectionDetails, cdmSources = newCdmSources, sourceIdx = TRUE, 
                 daimonIdx = TRUE, sqlOnly = TRUE)

## refresh WebAPI / Atlas sources
refreshAtlasSources(webApiUrl = "some-webapi-url.com", webApiPort = 8443, useHttps = TRUE)
  
```

## Technology

CdmAtlasCutover is an R package

## System Requirements

Requires R. 

## Dependencies

CdmAtlasCutover depends on the OHDSI DatabaseConnector and SqlRender packages as well as the StringR package.

## Getting Started

Use the following commands in R to install the DatabaseConnector package:

  ```r
  install.packages("devtools")
  devtools::install_github("OHDSI/CdmAtlasCutover")
  ```

## Getting Involved

* Developer questions/comments/feedback: <a href="http://forums.ohdsi.org/c/developers">OHDSI Forum</a>
* We use the <a href="../../issues">GitHub issue tracker</a> for all bugs/issues/enhancements

## License

CdmAtlasCutover is licensed under Apache License 2.0.

## Development

CdmAtlasCutover is being developed in RStudio.