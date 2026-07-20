\name{conservo}
\alias{conservo}
\title{Calculate Residue Conservation Scores}
\description{
This function is designed to calculate residue conservation scores from a multiple sequence alignment
using the BLOSUM62 substitution matrix. The function returns a named
numeric vector containing one conservation score for each alignment
position.
}
\usage{
conservo(alignment)
}
\arguments{
  \item{alignment}{
    An object of class \code{MsaAAMultipleAlignment} containing a
    multiple sequence alignment.
  }
}
\value{
A named numeric vector of residue conservation scores calculated using
the BLOSUM62 substitution matrix. The names correspond to the consensus
amino acid at each alignment position.
}
\examples{
alignment <- align(
  input = "protein_sequences.fasta",
  method = "ClustalOmega"
)

scores <- conservo(alignment)

scores
}