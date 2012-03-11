\name{train}
\alias{train}
\docType{data}
\title{Sample data for MDR package for n=1000, p=5000}
\description{
This dataset provides case/control disease status and genetic information.
}
\usage{data(train)}
\format{
A simulated data frame with 1000 observations on 5001 variables.  'Response' is a binary vector representing case(1) or control(0) status for a disease. Variables 'SNP.1' to 'SNP.5000' are numeric variables which represent genotype information (coded as 0,1,2) at 5000 loci.
}
\details{
This data was simulated with a larger number of samples and genetic predictor variables than \code{mdr1} and \code{mdr2} as an example for a larger association study. Can be used as part of a training-testing framework to build models to assess with \code{test} }

\seealso{ \code{\link{test}} }

\examples{
data(train)
}
\keyword{datasets}
