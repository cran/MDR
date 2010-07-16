\name{predict.mdr}
\alias{predict.mdr}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{MDR model predictions }
\description{
method for class \code{'mdr'} to predict case/control status for new data using a previously fit MDR model.
}
\usage{
\method{predict}{mdr}(object, new.data,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{an object of class \code{'mdr'}, a result of a call to either \code{mdr.cv} or \code{mdr.3WS}}
  \item{new.data}{a new data set with the same original variables in the same order, without the response}
\item{...}{additional arguments}
}

\value{
  a vector with predicted binary status
  ...
}
\author{Stacey Winham}

\seealso{ \code{\link{mdr.cv}}, \code{\link{mdr.3WS}}, \code{\link{summary.mdr}}, \code{\link{plot.mdr}} }
\examples{
#load data
data(mdr1)

#fit mdr model to a subset of the sample data
fit<-mdr.cv(data=mdr1[,1:11], K=2, cv=5) 

#create 'new' data from which to predict
new<-mdr1[,2:11] #same predictor variables, without the response

predict(fit, new.data=new) #predict case/control status for this 'new' data

}
