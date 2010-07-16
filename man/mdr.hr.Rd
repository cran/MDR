\name{mdr.hr}
\alias{mdr.hr}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Function to estimate the accuracy of an MDR model given high-risk/low-risk status of genotype combinations}
\description{
Determines the balanced accuracy (mean of sensitivity and specificity) of an MDR model (specified combination of loci and high-risk/low-risk genotype combinations) which minimize balanced accuracy.  Is used to determine prediction error estimates in cross-validation (\code{mdr.cv}).
}
\usage{
mdr.hr(split, model, hr, genotype = c(0, 1, 2))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{split}{the dataset; an n by (p+1) matrix where the first column is the binary response vector (coded 0 or 1) and the remaining columns are the p SNP genotypes (coded numerically)}
  \item{model}{a numeric vector of the final MDR model loci }
  \item{hr}{vector of binary indicators for high-risk/low-risk of the genotype combinations of the final model loci }
  \item{genotype}{a numeric vector of possible genotypes arising in \code{split}; default is c(0,1,2), but this vector can be longer or shorter depending on if more or fewer than three genotypes are possible}
}
\details{
When determining the high-risk/low-risk status of a genotype combination, the order of combinations uses the convention that the genotypes of the first locus vary the most, based on the function \code{\link{expand.grid}}. For instance, with 3 genotypes (0,1,2), a two-way interaction results in the following 9 combinations: (0,0), (1,0), (2,0), (0,1), (1,1), (2,1), (0,2), (1,2), (2,2).
}

\value{
List containing:
  \item{balanced accuracy}{Balanced accuracy estimate (the mean of sensitivity and specificity) of the specified MDR model}
  ...
}
\references{Ritchie et al (2001).  Multifactor-dimensionality reduction reveals high-order interactions among estrogen-metabolism genes in sporadic breast cancer. Am J Hm Genet 69, 138-147.

Velez et al (2007).  A balanced accuracy function for epistasis modeling in imbalanced datasets using multifactor dimensionality reduction. Genet Epidemiol 31, 306-315.
  }
\author{Stacey Winham}

\seealso{\code{\link{mdr}},\code{\link{mdr.cv}},\code{\link{mdr.3WS}} }

\examples{

#load test data
data(mdr1)

#split data into training and testing sets
train<-mdr1[1:125,]
test<-mdr1[-(1:125),]

#define matrix of all two-way combinations of 15 SNPs; this 105 by 2 matrix defines the 105 combinations of two-way interactions to consider 
loci<-t(combn(15,2)) 

#this runs mdr on the training data, considering the two-way combinations in 'loci', saving the top model, and defining the threshold as 1 since the data is balanced
fit<-mdr(train,loci,x=1,ratio=1) 

#estimate balanced accuracy given the MDR best model
acc<-mdr.hr(test,model=fit$models, hr=fit$high)

print(acc)


}