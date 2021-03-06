% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sesame.R
\name{getSexInfo}
\alias{getSexInfo}
\title{Get sex-related information}
\usage{
getSexInfo(sset)
}
\arguments{
\item{sset}{a \code{SigSet}}
}
\value{
medianY and medianX, fraction of XCI, methylated and unmethylated X
probes, median intensities of auto-chromosomes.
}
\description{
The function takes a \code{SigSet} and returns a vector of three
numerics: the median intensity of chrY probes; the median intensity of
chrX probes; and fraction of intermediate chrX probes. chrX and chrY
probes excludes pseudo-autosomal probes.
}
\examples{
sset <- makeExampleSeSAMeDataSet()
getSexInfo(sset)
}
