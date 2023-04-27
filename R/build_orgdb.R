#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly=TRUE)

website <- args[1]
dataversion <- args[2]
pkgversion <- args[3]

library(GO.db)

mart <- biomaRt::useMart(
  biomart = "plants_mart",
  version = dataversion,
  dataset = "taestivum_eg_gene",
  host = website
)

pkg_dir <- brookite::makeOrgDbFromBiomart(
  biomart = mart,
  version = pkgversion,
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