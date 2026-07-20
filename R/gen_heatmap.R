gen_heatmap <- function(scores){
  
  scores_df <- data.frame(
    position = seq_along(scores),
    score = as.numeric(scores),
    residue = names(scores)
  )
  
  ggplot2::ggplot(scores_df, aes(x = position, y = 1, fill = score))+
    ggplot2::geom_tile()+
    ggplot2::scale_fill_viridis_c(name = "BLOSUM62\nscore")+
    ggplot2::labs(x = "Residue position",
         y = NULL)+
    ggplot2::theme_classic()+
    ggplot2::theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank())
}


