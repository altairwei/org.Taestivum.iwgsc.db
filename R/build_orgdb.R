#!/usr/bin/env Rscript

library(GO.db)

mart <- biomaRt::useMart(
  biomart = "plants_mart",
  version = "Ensembl Plants Genes 52",
  dataset = "taestivum_eg_gene",
  host = "https://plants.ensembl.org"
)

pkg_dir <- brookite::makeOrgDbFromBiomart(
  biomart = mart,
  version = "0.0.1",
  maintainer = "Altair Wei <altair_wei@outlook.com>",
  author = "Altair Wei <altair_wei@outlook.com>",
  outputDir = ".",
  tax_id = "4565",
  genus = "Triticum",
  species = "aestivum",
  gid_type = "iwgsc"
)

filename <- pkgbuild::build(pkg_dir)

cat(filename)