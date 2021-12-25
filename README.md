# org.Taestivum.iwgsc.db

[![build](https://github.com/altairwei/org.Taestivum.iwgsc.db/actions/workflows/build.yaml/badge.svg)](https://github.com/altairwei/org.Taestivum.iwgsc.db/actions/workflows/build.yaml)

This repository will generate OrgDb packages for wheat based on Ensembl Plants' BioMart data. You can find download urls of the built packages on the release page.

How to use:

```R
# You can find OrgDb package on release page
pkg_url = "https://github.com/altairwei/org.Taestivum.iwgsc.db/releases/download/v0.0.2/org.Taestivum.iwgsc.db_0.0.2.tar.gz"

# Install OrgDb package via url
remotes::install_url(pkg_url)

# Load wheat OrgDb
library(org.Taestivum.iwgsc.db)

# You can give an alias to wheat OrgDb object
odb <- org.Taestivum.iwgsc.db

# See available data type
keytypes(odb)
```