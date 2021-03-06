% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Query-generics.R, R/Query-methods.R
\docType{methods}
\name{MaxResults}
\alias{MaxResults}
\alias{MaxResults<-}
\alias{MaxResults,.query-method}
\alias{MaxResults<-,.query-method}
\title{MaxResults.}
\usage{
MaxResults(object, value)

MaxResults(object) <- value

\S4method{MaxResults}{.query}(object)

\S4method{MaxResults}{.query}(object) <- value
}
\arguments{
\item{object}{a query object.}

\item{value}{replacement value for the max-results parameter of the query.}
}
\description{
Get the value set for MaxResults.

Set the maximum rows returned by a ganalytics query.
}
\section{Methods (by class)}{
\itemize{
\item \code{.query}: Return the maximum number of rows a query is allowed to return.

\item \code{.query}: Set the maximum number of rows a query is allowed to return.
}}

