\name{summary.mdr}
\alias{summary.mdr}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Summarizing the results of an MDR model}
\description{
summary method for class \code{'mdr'}, after fitting with \code{mdr.cv} or \code{mdr.3WS}
}
\usage{
\method{summary}{mdr}(object,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{an object of class \code{'mdr'}, a result of a call to either \code{mdr.cv} or \code{mdr.3WS} }
\item{...}{additional arguments}
}

\value{
a table, with columns for level of interaction, bests MDR models for each level (including overall best model), and accuracy results.  Accuracy results depend on the validation method for \code{object}.

  \item{Level}{level of interaction}
  \item{Best Models}{best MDR by level}
  \item{Classification Accuracy}{average classification accuracy (percent) calculated from the training sets; for \code{mdr.cv}}
  \item{Prediction Accuracy}{average prediction accuracy (percent) calculated from the testing sets; for \code{mdr.cv}}
  \item{Cross-Validation Consistency}{the number for times a model was chosen as 'best' out of k, for k-fold cross-validation; for \code{mdr.cv}}
  \item{Training Accuracy}{classification accuracy (percent) calculated from the training set; for \code{mdr.3WS}}
  \item{Testing Accuracy}{classification accuracy (percent) calculated from the testing set; for \code{mdr.3WS}}
  \item{Validation Accuracy}{classification accuracy (percent) calculated from the validation set; for \code{mdr.3WS}}
  ...
}

\author{Stacey Winham}

\seealso{ \code{\link{mdr.cv}}, \code{\link{mdr.3WS}}, \code{\link{predict.mdr}}, \code{\link{plot.mdr}} }
\examples{
#load test data
data(mdr1) #consider a subset with the response and the first 10 predictors

fit1<-mdr.3WS(data=mdr1[,1:11],K=2) #fit mdr model with 3WS
summary(fit1) #summarizes results of the fit

fit2<-mdr.cv(data=mdr1[,1:11],K=2,cv=5) #fit mdr model with 5-fold CV
summary(fit2)


}