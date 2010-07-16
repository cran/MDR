\name{mdr.3WS}
\alias{mdr.3WS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A function to perform MDR on a dataset using the three-way split for internal validation.}
\description{
Determines the best MDR model up to a specified size of interaction \code{K} by minimizing balanced accuracy (arithmetic mean of sensitivity and specificity), while using a three-way split internal validation method. The three-way split randomly separates the data into training, testing, and validation sets.  The function \code{mdr.3WS} is essentially a wrapper for the function \code{mdr}.
}
\usage{
mdr.3WS(data, K, x = NULL, proportion = NULL, ratio = NULL, equal = "HR", genotype = c(0, 1, 2))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{the dataset; an n by (p+1) matrix where the first column is the binary response vector (coded 0 or 1) and the remaining columns are the p SNP genotypes (coded numerically)}
  \item{K}{the highest level of interaction to consider }
  \item{x}{the number of models from the training set to retain in the testing set }
  \item{proportion}{a three-dimensional vector specifying the ratio of split proportions training:testing:validation (default is 2:2:1 denoted as c(2,2,1)) }
  \item{ratio}{the case/control ratio threshold to ascribe high-risk/low-risk status of a genotype combination }
  \item{equal}{how to treat genotype combinations with case/control ratio equal to the threshold; default is "HR" for high-risk, but can also consider "LR" for low-risk }
  \item{genotype}{a numeric vector of possible genotypes arising in \code{data}; default is c(0,1,2), but this vector can be longer or shorter depending on if more or fewer than three genotypes are possible }
}
\details{
MDR is a non-parametric data-mining approach to variable selection designed to detect gene-gene or gene-environment interactions in case-control studies. This function uses balanced accuracy as the evaluation measure to rank potential models.  An overall best model is chosen to minimize balanced accuracy, while also preventing model over-fitting with internal validation.  This function uses a three-way split of the data (training set for model building, testing set for replication, and validation set for prediction) for internal validation. 
}
\value{
An object of class \code{'mdr'}, which is a list containing:
  \item{final model}{a numeric vector of the predictors included in the final model}
  \item{final model accuracy}{the balanced accuracy of the final model from the validation set}
  \item{top models}{a list containing the best model (with minimum BA) for each level of interaction, from 1 to \code{K}}
  \item{top model accuracies}{a matrix containing the training, testing, and validation accuracies for each level of interaction, from 1 to \code{K}}
  \item{high-risk/low-risk }{a vector of the high-risk/low-risk parameterizations of the genotype combinations for the final model}
  \item{genotypes}{the numeric vector of possible genotypes specified}
  \item{validation method}{"3WS", since a three-way split internal validation procedure was utilized}
  ...

}
\references{ 
{ Ritchie et al (2001).  Multifactor-dimensionality reduction reveals high-order interactions among estrogen-metabolism genes in sporadic breast cancer. Am J Hm Genet 69, 138-147.

Velez et al (2007).  A balanced accuracy function for epistasis modeling in imbalanced datasets using multifactor dimensionality reduction. Genet Epidemiol 31, 306-315.

Winham SJ and Motsinger AA (2010).  A comparison of internal validation techniques for multifactor dimensionality reduction.  BMC Bioinformatics.
 }

 }

\author{ Stacey Winham }
\note{ When determining the high-risk/low-risk status of a genotype combination, the order of combinations uses the convention that the genotypes of the first locus vary the most, based on the function \code{\link{expand.grid}}. For instance, with 3 genotypes (0,1,2), a two-way interaction results in the following 9 combinations: (0,0), (1,0), (2,0), (0,1), (1,1), (2,1), (0,2), (1,2), (2,2).  
  }

\section{Warning}{
MDR is a combinatorial search approach, so considering high-order interactions (i.e. large values for \code{K}) can be computationally expensive.

}


\seealso{ \code{\link{mdr.cv}}, \code{\link{mdr}}, \code{\link{boot.error}}, \code{\link{mdr.ca.adj}}, \code{\link{permute.mdr}}, \code{\link{plot.mdr}}, \code{\link{predict.mdr}}, \code{\link{summary.mdr}} }

\examples{
#load test data
data(mdr1)

fit<-mdr.3WS(data=mdr1[,1:11], K=3, x = NULL, proportion = NULL, ratio = NULL, equal = "HR", genotype = c(0, 1, 2)) #fit MDR with 3WS to a subset of the sample data, allowing for 1 to 3-way interactions

print(fit) #view the fitted mdr object

summary(fit) #create summary table of best MDR model

plot(fit, data=mdr1) #create contingency plot of best MDR model; may need to expand the plot window for large values of K

}