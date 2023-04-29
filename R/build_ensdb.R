#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly=TRUE)

ensversion <- as.integer(args[1])
pkgversion <- args[2]

cat("Fetching tables from Ensembl...")
ensembldb::fetchTablesFromEnsembl(
    ensversion,
    host = "mysql-eg-publicsql.ebi.ac.uk",
    port = 4157,
    species = "triticum aestivum")

cat("Making Ensemble SQLite...")
DBFile <- ensembldb::makeEnsemblSQLiteFromTables()

cat("Making EnsDb pacakge...")
ensembldb::makeEnsembldbPackage(
    ensdb = DBFile,
    version = pkgversion,
    maintainer = "Altair Wei <altair_wei@outlook.com>",
    author = "Altair Wei")

cat("Building EnsDb pacakge...")
filename <- pkgbuild::build(paste0("EnsDb.Taestivum.v", ensversion))

cat(filename)
