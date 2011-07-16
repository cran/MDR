\name{permute.mdr}
\alias{permute.mdr}

\title{Function to perform a permutation test after fitting an MDR model }
\description{
After fitting an object of class \code{'mdr'}, performs a permutation test to assess the statistical significance of the balanced accuracy evaluation measure of the 'best model'.
}
\usage{
permute.mdr(accuracy, loci, N.permute, method = c("CV", "3WS"), data, cv, K, x = NULL, proportion = NULL, ratio = NULL, equal = "HR", genotype = c(0, 1, 2), LRT=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{accuracy}{the accuracy measure reported from the MDR model fit (after fitting either \code{mdr.cv} or \code{mdr.3WS}) }
  \item{loci}{the identified loci from the MDR model fit }
  \item{N.permute}{the number of data permutations to perform }
  \item{method}{internal validation method used to fit the model, either "CV" for \code{mdr.cv} or "3WS" for \code{mdr.3WS} }
  \item{data}{dataset used to fit the MDR model; first column is the binary response vector and subsequent columns are numeric SNP data }
  \item{cv}{if method="CV", the number of cross-validation intervals }
  \item{K}{the maximum size of interaction to consider }
  \item{x}{if method="3WS", the number of models to save from the training set to be evaluated in the testing set; if NULL, default is number of total loci }
  \item{proportion}{if method="3WS", a vector with the ratio of data for training:testing:validation sets; if NULL, default is c(2,2,1) }
  \item{ratio}{case/control ratio threshold to ascribe high-risk/low-risk status of a genotype combination; if NULL, default is the ratio of cases to controls in the whole dataset }
  \item{equal}{how to treat genotype combinations with case/control ratio equal to the threshold; if NULL, default is "HR" for high-risk, but can also consider "LR" for low-risk }
  \item{genotype}{a numeric vector of possible genotypes arising in \code{data}; if NULL, default is c(0,1,2) }
  \item{LRT}{a logical indicating if a likelihood ratio test for significant interaction should be performed}
}
\details{
Obtains permuted datasets by permuting the response vector only, in order to preserve the LD structure within the genetic data. 
}
\value{
  Returns a list with: 
  \item{Permutation P-value }{the empirical p-value based on the permutation distribution; i.e. the proportion of permutations with balanced accuracy > \code{accuracy}}
  \item{Permutation Distribution }{a vector with the top balanced accuracies from all \code{N.permute} permutations}
  \item{LRT P-value}{if LRT=TRUE, the empirical p-value for a test of interaction based on the LRT distribution}
  \item{LRT Distribution}{if LRT=TRUE, a vector with p-values for the LRT test of interaction from all \code{N.permute} permutations}
  ...
}
\references{ 
Ritchie MD et al (2001).  Multifactor-dimensionality reduction reveals high-order interactions among estrogen-metabolism genes in sporadic breast cancer. Am J Hm Genet 69(1): 138-147.

Hahn LW, Ritchie MD, Moore JH (2003). Multifactor dimensionality reduction software for detecting gene-gene and gene-environment interactions.  Bioinformatics 19(3):376-82.

Velez DR et al (2007).  A balanced accuracy function for epistasis modeling in imbalanced datasets using multifactor dimensionality reduction. Genet Epidemiol 31(4): 306-315.

Motsinger-Reif AA (2008).  The effect of alternative permutation testing strategies on the performance of multifactor dimensionality reduction.  BMC Research Notes 1:139.

Edwards TL et al (2010).  A General Framework for Formal Tests of Interaction after Exhaustive Search Methods with Applications to MDR and MDR-PDT.  PLoS One 5(2).
 }
\author{Stacey Winham}

\seealso{\code{\link{mdr.cv}}, \code{\link{mdr.3WS}} }
\examples{
#load data
data(mdr1)

#fit an mdr object to a subset of the sample data
fit<-mdr.3WS(data=mdr1[,1:11],K=2)

####save the accuracy
acc<-fit$'final model accuracy'

###save the final model loci
loc<-fit$'final model'

####run permutation test on 10 permutations
perm<-permute.mdr(accuracy=acc, loci=loc, N.permute=10, method="3WS",data=mdr1[,1:11], K=2, LRT=TRUE)

###empirical p-value
perm$'Permutation P-value'

}
