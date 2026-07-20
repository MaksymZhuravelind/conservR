test_that("invalid alignment method gives error", {
  expect_error(align(inptut = "Seq_dataset_vert_cropped.FASTA", method = "blablabla"))
})
test_that("output filename is created by defalut", {
  align(input = "Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  expect_true(file.exists("ClustalOmega_aln.fasta"))
  file.remove("ClustalOmega_aln.fasta")
})
test_that("wrong input file loaded", {
  expect_error(
    align("not_existing.fasta", method = "ClustalOmega"),
    "Input FASTA file does not exist"
  )
})
test_that("align returns an MsaAAMultipleAlignment object", {
  aln <- align(input = "Seq_dataset_vert_cropped.FASTA", method = "ClustalOmega")
  expect_s4_class(aln, "MsaAAMultipleAlignment")
})
test_that("align writes an output FASTA file", {
  outfile <- tempfile(fileext = ".fasta")
  align(input = "Seq_dataset_vert_cropped.FASTA", output = outfile, method = "ClustalOmega")
  expect_true(file.exists(outfile))
})
