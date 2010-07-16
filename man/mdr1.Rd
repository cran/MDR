\name{mdr1}
\alias{mdr1}
\docType{data}
\title{Sample data for MDR package for n=250, p=25}
\description{
This dataset provides case/control disease status and genetic information.
}
\usage{data(mdr1)}
\format{
A simulated data frame with 250 observations on 26 variables.  'Response' is a binary vector representing case(1) or control(0) status for a disease. Variables 'SNP.1' to 'SNP.25' are numeric variables which represent genotype information (coded as 0,1,2) at 25 loci.
}
\details{
This data was simulated with an equal number of cases and controls according to a variation on the dominant-dominant model of Neuman and Rice and represents a two-way interaction with main effects at 5 percent heritability.  The true disease-causing loci are SNP.4 and SNP.9, generated with minor allele frequency 0.5.  The expected balanced accuracy for this model is 66.16%. 

The penetrance function used to generate the case/control data based on the 9 possible genotype combinations is as follows: 
       \tabular{llll}{
         Genotype \tab BB   \tab Bb \tab bb\cr
         AA \tab 0.05   \tab 0.05 \tab 0.05\cr
         Aa \tab 0.05   \tab 0.206 \tab 0.206\cr
         aa \tab 0.05   \tab 0.206 \tab 0.206\cr
}
 }


\references{
Neuman RJ, Rice JP. (1992). TWO-LOCUS MODELS OF DISEASE. Genetic Epidemiology 9(5):347-365.

Culverhouse R, et al (2002). A perspective on epistasis: limits of models displaying no main effect. Am J Hum Genet, 70(2):461-471. 
}

\examples{
data(mdr1)
}
\keyword{datasets}
