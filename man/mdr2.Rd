\name{mdr2}
\alias{mdr2}
\docType{data}
\title{Sample data for MDR package for n=250, p=100}
\description{
This dataset provides case/control disease status and genetic information.
}
\usage{data(mdr2)}
\format{
A simulated data frame with 250 observations on 101 variables.  'Response' is a binary vector representing case(1) or control(0) status for a disease. Variables 'SNP.1' to 'SNP.100' are numeric variables which represent genotype information (coded as 0,1,2) at 100 loci.
}
\details{
This data was simulated with an equal number of cases and controls according to a variation on the purely-epistatic XOR model of Li and Reich and represents a two-way interaction in the absence of marginal effects at 5 percent heritability.  The true disease-causing loci are SNP.4 and SNP.9, generated with minor allele frequency 0.5.  The expected balanced accuracy for this model is 67.09%. 

The penetrance function used to generate the case/control data based on the 9 possible genotype combinationsis as follows: 
       \tabular{llll}{
         Genotype \tab BB   \tab Bb \tab bb\cr
         AA \tab 0.199   \tab 0.05 \tab 0.199\cr
         Aa \tab 0.05   \tab 0.199 \tab 0.05\cr
         aa \tab 0.199   \tab 0.05 \tab 0.199\cr
}
}

\references{
Li W, Reich J. 2000. A complete enumeration and classification of two-locus disease models. Hum Hered 50(6):334-49.

Culverhouse R, et al (2002). A perspective on epistasis: limits of models displaying no main effect. Am J Hum Genet, 70(2):461-471.
}
\examples{
data(mdr2)
}
\keyword{datasets}
