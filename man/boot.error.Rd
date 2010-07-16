\name{boot.error}
\alias{boot.error}
\title{ Function to calculate a post-hoc prediction estimate of classification error adjusted for population prevalence using bootstrap resampling }
\description{
  After fitting an MDR object and obtaining a best model, calculate an estimate of classification error that has been adjusted for retrospective sampling and accounts for disease prevalence using a bootstrap, as implemented in Winham SJ and Motsinger-Reif AA, 2010, "The effect of retrospective sampling on estimates of prediction error for multifactor dimensionality reduction," Annals of Human Genetics.
}
\usage{
boot.error(data, prev, model, hr, b, genotype = c(0, 1, 2))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{the dataset; an n by (p+1) matrix where the first column is the binary response vector (coded 0 or 1) and the remaining columns are the p SNP genotypes (coded numerically) }
  \item{prev}{an estimate of population prevalence (from prior studies, etc.) }
  \item{model}{a numeric vector of the final MDR model loci }
  \item{hr}{vector of binary indicators for high-risk/low-risk of the genotype combinations of the final model loci }
  \item{b}{number of bootstrap samples }
  \item{genotype}{a numeric vector of possible genotypes arising in \code{data}; default is c(0,1,2), but this vector can be longer or shorter depending on if more or fewer than three genotypes are possible }
}

\details{
MDR provides a prediction error estimate of the final model calculated from retrospective data.  To provide a prospective prediction estimate, an accurate estimate of the population prevalence rate must be incorporated.
}

\value{
A list containing: 
  \item{classification error estimate}{post-hoc prediction estimate of classification error adjusted for prevalence, measured as a percentage}
  \item{classification accuracy estimate}{post-hoc prediction estimate of classification accuracy (100-classification error) adjusted for prevalence}
  ...
}
\references{ 
Ritchie MD et al (2001).  Multifactor-dimensionality reduction reveals high-order interactions among estrogen-metabolism genes in sporadic breast cancer. Am J Hm Genet 69(1): 138-147.

Winham SJ and Motsinger-Reif AA (2010).  The effect of retrospective sampling on estimates of prediction error for multifactor dimensionality reduction.  Annals of Human Genetics.
 }
\author{Stacey Winham}

\note{ When determining the high-risk/low-risk status of a genotype combination, the order of combinations uses the convention that the genotypes of the first locus vary the most, based on the function \code{\link{expand.grid}}. For instance, with 3 genotypes (0,1,2), a two-way interaction results in the following 9 combinations: (0,0), (1,0), (2,0), (0,1), (1,1), (2,1), (0,2), (1,2), (2,2).
} 

\seealso{\code{\link{mdr.cv}}, \code{\link{mdr.3WS}}, \code{\link{mdr.ca.adj}} }

\examples{
#load test data
data(mdr1)

#this runs mdr with 5-fold cross-validation on a subset of the sample data, considering all pairwise combinations (K=2)
fit<-mdr.cv(mdr1[1:11],K=2,cv=5) 

#calculates bootstrap estimate from b=100 bootstrap samples of the sample data for the previously fit MDR object 'fit', assuming the population prevalence is 10%
boot.error(mdr1,prev=0.10, model=fit$'final model', hr=fit$'high-risk/low-risk', b=100)

}