\name{plot.mdr}
\alias{plot.mdr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plotting the results of an MDR model}
\description{
a method for class \code{'mdr'} to plot case/control counts for each factor combination of a previously fit MDR model
}
\usage{
\method{plot}{mdr}(x, data, main="", xlab="", ylab="Count", table=FALSE,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{an object of class \code{'mdr'}, a result of a call to either \code{mdr.cv} or \code{mdr.3WS} }
  \item{data}{data set used to fit \code{object} }
  \item{main}{title for the plot; default is no title}
  \item{xlab}{Label for the x-axis; default is no label}
  \item{ylab}{Label for the y-axis; default is "Count"}
  \item{table}{logical for whether a summary table of case/control counts should be produced; default is FALSE}
  \item{...}{additional arguments}
}
\details{
A call to \code{plot} produces a trellis-style bar chart of case and control counts for each factor combination from \code{object}.  Cases are plotted in black and controls are plotted in white.  Factor combinations considered 'high-risk' are shaded gray, as seen in the legend.
}

\author{Stacey Winham}
\note{Requires the package \code{lattice}. For models of size 3 or greater, stretch the plot window for better viewing.
}

\seealso{ \code{\link{mdr.cv}}, \code{\link{mdr.3WS}}, \code{\link{predict.mdr}}, \code{\link{summary.mdr}} }
\examples{
#load data
data(mdr1)

#fit mdr model to a subset of the sample data
fit<-mdr.cv(data=mdr1[,1:11], K=2, cv=5) 

plot(fit, data=mdr1)

}