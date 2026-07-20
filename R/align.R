align <- function(input, output = NULL, method = c("ClustalOmega", "ClustalW", "Muscle")){
  if (missing(method)) {
    stop("Please specify an alignment method.")
  }
  if (!method %in% c("ClustalOmega", "ClustalW", "Muscle")) {
    stop("method must be one of: 'ClustalOmega', 'ClustalW', or 'Muscle'.")
  }
  method <- match.arg(method)
  if(!file.exists(input)){
    stop("Input FASTA file does not exist.")
    message("Check location of your FASTA.")
  }
  
  inputSeqs <- Biostrings::readAAStringSet(input)
  alignment <- msa::msa(inputSeqs, method = method)
  aligned_sequences <- as(alignment, "AAStringSet")
  
  if(is.null(output)) {
    output <- paste0(method, "_aln.fasta")
  } 
  Biostrings::writeXStringSet(aligned_sequences, filepath = output)
  return(alignment)
  }
