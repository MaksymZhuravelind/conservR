test_that("conservo will return a vector with numbers",{
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  expect_type(scores, "double")
})
test_that("conservation scores have the correct length", {
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  expect_equal(length(scores), Biostrings::width(Biostrings::unmasked(alignment))[1])
})
test_that("residues are named", {
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  expect_false(is.null(names(scores)))
})
test_that("conservo will reject wrong input", {
  expect_error(
    conservo("not an alignment"),
    "'alignment' must be an MsaAAMultipleAlignment object.")
})
test_that("conservation scores contain no missing values", {
  alignment <- align("Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  scores <- conservo(alignment)
  expect_false(any(is.na(scores)))
})
