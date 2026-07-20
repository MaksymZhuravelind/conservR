test_that("the function generates a ggplot object",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  lineplot <- gen_lineplot(scores)
  expect_s3_class(lineplot, "ggplot")
})
test_that("line plot contains one observation per residue",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  lineplot <- gen_lineplot(scores)
  expect_equal(nrow(lineplot$data), length(scores))
})
test_that("heatmap contains correct columns",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  lineplot <- gen_lineplot(scores)
  expect_true(all(c("position", "score", "residue") %in% names(lineplot$data)))
})
