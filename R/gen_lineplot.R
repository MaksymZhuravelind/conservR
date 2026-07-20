gen_lineplot <- function(scores){
  
  scores_df <- data.frame(
    position = seq_along(scores),
    score = as.numeric(scores),
    residue = names(scores)
  )
  
  ggplot2::ggplot(scores_df,
                  aes(x = position,
                      y = score)) +
    ggplot2::geom_line() +
    ggplot2::geom_point(size = 0.5) +
    ggplot2::labs(x = "Residue position",
                  y = "BLOSUM62 conservation score") +
    ggplot2::theme_minimal()
}
