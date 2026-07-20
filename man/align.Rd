\name{align}
\alias{align}
\title{Perform Multiple Sequence Alignment}
\description{
Performs a multiple sequence alignment of protein sequences from a FASTA
file using one of the supported alignment methods. The aligned sequences
are written to a FASTA file, and the alignment object is returned.
}
\usage{
align(
  input,
  output = NULL,
  method = c("ClustalOmega", "ClustalW", "Muscle")
)
}
\arguments{
  \item{input}{
    Character string specifying the path to the input FASTA file
    containing protein sequences.
  }

  \item{output}{
    Character string specifying the output FASTA file. If \code{NULL},
    the output file is automatically named according to the selected
    alignment method (e.g., \code{"ClustalOmega_aln.fasta"}).
  }

  \item{method}{
    Character string specifying the alignment algorithm. Available
    methods are \code{"ClustalOmega"}, \code{"ClustalW"}, and
    \code{"Muscle"}.
  }
}
\value{
An object of class \code{MsaAAMultipleAlignment}.
}
\examples{
alignment <- align(
  input = "protein_sequences.fasta",
  method = "ClustalOmega"
)

alignment
}