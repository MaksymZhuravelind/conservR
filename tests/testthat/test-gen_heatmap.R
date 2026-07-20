test_that("the function generates a ggplot object",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  heatmap <- gen_heatmap(scores)
  expect_s3_class(heatmap, "ggplot")
})
test_that("heatmap contains one column per residue",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  heatmap <- gen_heatmap(scores)
  expect_equal(nrow(heatmap$data), length(scores))
})
test_that("heatmap contains correct columns",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  heatmap <- gen_heatmap(scores)
  expect_true(all(c("position", "score", "residue") %in% names(heatmap$data)))
})
