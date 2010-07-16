\name{mdr}
\alias{mdr}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Function to perform MDR on a dataset for a given set of loci}
\description{
Determines the top \code{x} MDR models over a specified set of combinations of loci which minimize balanced accuracy (mean of sensitivity and specificity).  Ideally, should be used in conjunction with an internal validation method, such as cross-validation (\code{mdr.cv}) or a three-way split (\code{mdr.3WS}). 
}
\usage{
mdr(split, comb, x, ratio, equal = "HR", genotype = c(0, 1, 2))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{split}{the dataset; an n by (p+1) matrix where the first column is the binary response vector (coded 0 or 1) and the remaining columns are the p SNP genotypes (coded numerically) }
  \item{comb}{a matrix of SNP combinations to consider; the rows represent a given combination and the columns represent the SNP number; to consider k-way interactions, \code{comb} should have k columns. }
  \item{x}{the number of "best" combinations to retain }
  \item{ratio}{the case/control ratio threshold to ascribe high-risk/low-risk status of a genotype combination }
  \item{equal}{how to treat genotype combinations with case/control ratio equal to the threshold; default is "HR" for high-risk, but can also consider "LR" for low-risk }
  \item{genotype}{a numeric vector of possible genotypes arising in \code{split}; default is c(0,1,2), but this vector can be longer or shorter depending on if more or fewer than three genotypes are possible }
}
\details{
MDR is a non-parametric data-mining approach to variable selection designed to detect gene-gene or gene-environment interactions in case-control studies. This function uses balanced accuracy as the evaluation measure to rank potential models.
}

\value{
  a list with the MDR model fit containing:
  \item{models }{a matrix of the "best" \code{x} combinations of loci from \code{comb}; each row represents a 'model' }
  \item{balanced accuracy }{a vector of balanced accuracies for each of the `best models' }
  \item{high-risk/low-risk }{a matrix of the high-risk/low-risk parameterizations of the genotype combinations for each of the `best models'; each row represents a 'model' and the associated vector is an indicator of high-risk status for each genotype combination.}
  ...
}

\references{ Ritchie et al (2001).  Multifactor-dimensionality reduction reveals high-order interactions among estrogen-metabolism genes in sporadic breast cancer. Am J Hm Genet 69, 138-147.

Velez et al (2007).  A balanced accuracy function for epistasis modeling in imbalanced datasets using multifactor dimensionality reduction. Genet Epidemiol 31, 306-315.
  }

\author{Stacey Winham}

\note{When determining the high-risk/low-risk status of a genotype combination, the order of combinations uses the convention that the genotypes of the first locus vary the most, based on the function \code{\link{expand.grid}}. For instance, with 3 genotypes (0,1,2), a two-way interaction results in the following 9 combinations: (0,0), (1,0), (2,0), (0,1), (1,1), (2,1), (0,2), (1,2), (2,2).   
 } 

\section{Warning}{
MDR is a combinatorial search approach, so considering high-order interactions can be computationally expensive.


}



\seealso{\code{\link{mdr.cv}},\code{\link{mdr.3WS}}  }
\examples{
#load test data
data(mdr1)

#define matrix of all two-way combinations of 15 SNPs; this 105 by 2 matrix defines the 105 combinations of two-way interactions to consider 
loci<-t(combn(15,2)) 

#this runs mdr on the sample data, considering the two-way combinations in 'loci', saving the top 5 models, and defining the threshold as 1 since the data is balanced
fit<-mdr(mdr1,loci,x=5,ratio=1) 

print(fit) #view the fitted mdr object

}

