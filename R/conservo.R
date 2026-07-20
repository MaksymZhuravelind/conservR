
conservo <- function(alignment){
  if(!inherits(alignment, "MsaAAMultipleAlignment")){
    stop("'alignment' must be an MsaAAMultipleAlignment object.")
  }
  data(BLOSUM62)
  scores <- msa::msaConservationScore(alignment, BLOSUM62)
  return(scores)
}

