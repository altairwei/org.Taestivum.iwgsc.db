#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly=TRUE)

ensversion <- args[1]
pkgversion <- args[2]

ensembldb::fetchTablesFromEnsembl(
    ensversion,
    host = "mysql-eg-publicsql.ebi.ac.uk",
    port = 4157,
    species = "triticum aestivum")

DBFile <- ensembldb::makeEnsemblSQLiteFromTables()

ensembldb::makeEnsembldbPackage(
    ensdb = DBFile,
    version = pkgversion,
    maintainer = "Altair Wei <altair_wei@outlook.com>",
    author = "Altair Wei")

filename <- pkgbuild::build(paste0("EnsDb.Taestivum.v", ensversion))

cat(filename)
