#!/usr/bin/env Rscript

ensembldb::fetchTablesFromEnsembl(101, host = "mysql-eg-publicsql.ebi.ac.uk", port = 4157, species = "triticum aestivum")
DBFile <- ensembldb::makeEnsemblSQLiteFromTables()
ensembldb::makeEnsembldbPackage(ensdb = DBFile, version = "0.0.0.9000", maintainer = "Altair Wei <altair_wei@outlook.com>", author = "Altair Wei")

filename <- pkgbuild::build(pkg_dir)

cat(filename)
