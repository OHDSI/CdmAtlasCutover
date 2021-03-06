% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CdmAtlasCutover.R
\name{refreshAtlasSources}
\alias{refreshAtlasSources}
\title{Refresh CDM sources in Atlas}
\usage{
refreshAtlasSources(baseUrl)
}
\arguments{
\item{baseUrl}{The base URL for the WebApi instance, for example:
"http://api.ohdsi.org:80/WebAPI".}
}
\description{
Refresh CDM sources in Atlas
}
\details{
Refreshes the source cache that feeds into Atlas. 
This step is necessary when making changes to the SOURCE and SOURCE_DAIMON tables,
so that the changes propagate to Atlas.
}
\author{
Ajit Londhe
}
