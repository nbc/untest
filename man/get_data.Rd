% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-data.R
\name{get_data}
\alias{get_data}
\title{Get data}
\usage{
get_data(
  data,
  query = list(),
  col_types = cols(.default = "c"),
  concat = TRUE,
  directory = tempdir()
)
}
\arguments{
\item{data}{a tibble issued from \verb{datafiles() or a dataframe with two columns }rid\code{and}millesime`.}

\item{query}{a query to pass to the API to select columns and filter on
values.}

\item{col_types}{how to convert columns, the default is to use char for all
columns \code{cols(.default = "c")}}

\item{concat}{\code{TRUE}}

\item{directory}{the directory to cache/save downloaded files. Default is \code{tempdir()}}
}
\value{
If concat is \code{TRUE} (default), return a tibble with all data concatenated in
one tibble.
If concat is \code{FALSE}, return a list of tibbles.

\code{get_data()} returns only chr
}
\description{
Get the data of the last millesime of all the datafiles found in data. All
columns are returned as \code{chr} (see below).
}
\details{
You can use \code{convert()} to convert number and integer.

For private life reason, data returned by DiDo can be secretize (the value is
replaced by the string "secret") so readr can't determine data type.
}
\examples{
# get all columns
datafiles() \%>\%
  dido_search("drom") \%>\%
  get_data()
# get only DEPARTEMENT_CODE and ESSENCE_M3 columns
datafiles() \%>\%
  dido_search("drom") \%>\%
  get_data(query = c(columns = "DEPARTEMENT_CODE,ESSENCE_M3"))
# get only rows where `DEPARTEMENT_CODE == 971
datafiles() \%>\%
  dido_search("drom") \%>\%
  get_data(query = c(DEPARTEMENT_CODE = "eq:971"))
datafiles() \%>\%
  dido_search("drom") \%>\%
  get_data(query = c(DEPARTEMENT_CODE = "eq:971"), directory = tempdir())
}
