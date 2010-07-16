\name{compare}
\alias{compare}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{Function for internal use only ...}
\description{
This function is for internal use only; it counts the number of matches of an individual data vector with the rows of a target matrix, and is called by the function \code{mdr}
}
\usage{
compare(mat, vec, k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mat}{target matrix}
  \item{vec}{vector to be matched}
  \item{k}{length of \code{vector}}
}

\value{
scalar, the total number of matches
}
\author{Stacey Winham}
\seealso{\code{\link{mdr}}, \code{\link{mdr.cv}}, \code{\link{mdr.3WS}} }
