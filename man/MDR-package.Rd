\name{MDR-package}
\alias{MDR-package}
\alias{MDR}
\docType{package}
\title{
Detect gene-gene interactions using multifactor dimensionality reduction
}
\description{
Performs multifactor dimensionality reduction (MDR) to detect potential gene-gene interactions in case-control studies, using balanced accuracy as an evaluation measure to rank potential models.  Offers both cross-validation (CV) and a three-way split as internal validation methods to prevent over-fitting, as well as permutation testing and post-hoc prediction estimates.
}
\details{
\tabular{ll}{
Package: \tab MDR\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2011-07-16\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
~~ This is an early test release. ~~ 
}

\section{Index}{
\itemize{
\item{\code{mdr}}{ Performs MDR over a specified set of combinations of variables/loci}
\item{\code{mdr.hr}}{ Estimates the accuracy of an MDR model given high-risk/low-risk status}
\item{\code{mdr.cv}}{ Implements MDR with cross-validation}
\item{\code{mdr.3WS}}{ Implements MDR with a three-way split internal model validation}
\item{\code{boot.error}}{ Calculates a post-hoc bootstrap prediction estimate of classification error} 
\item{\code{mdr.ca.adj}}{ Calculates a post-hoc adjusted prediction estimate of classification accuracy} 
\item{\code{permute.mdr}}{ Performs a permutation test on an object of class \code{mdr}}
\item{\code{plot}}{ Plots the best model of an object of class \code{mdr}} 
\item{\code{summary}}{ Summarizes a previously fit object of class \code{mdr}}
\item{\code{predict}}{ Predicts case-control status on new data using a previously fit object of class \code{mdr}}
}
}

\author{
Stacey Winham

Maintainers: Stacey Winham <stacey.winham@gmail.com>

Alison Motsinger-Reif <alison.motsinger@gmail.com>

David Reif <reif.david@gmail.com>

}
\references{ 
Ritchie MD et al (2001).  Multifactor-dimensionality reduction reveals high-order interactions among estrogen-metabolism genes in sporadic breast cancer. Am J Hm Genet 69(1): 138-147.

Hahn LW, Ritchie MD, Moore JH (2003). Multifactor dimensionality reduction software for detecting gene-gene and gene-environment interactions.  Bioinformatics 19(3):376-82.

Velez DR et al (2007).  A balanced accuracy function for epistasis modeling in imbalanced datasets using multifactor dimensionality reduction. Genet Epidemiol 31(4): 306-315.

Winham SJ and Motsinger AA (2010).  The effect of retrospective sampling on estimates of prediction error for multifactor dimensionality reduction.  Annals of Human Genetics.

Winham SJ and Motsinger AA (2010).  A comparison of internal validation techniques for multifactor dimensionality reduction.  BMC Bioinformatics.

Edwards TL et al (2010).  A General Framework for Formal Tests of Interaction after Exhaustive Search Methods with Applications to MDR and MDR-PDT.  PLoS One 5(2).
}
