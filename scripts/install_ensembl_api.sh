#!/bin/bash

set -e -o pipefail
shopt -s failglob
export LC_ALL=C

VER=$1

cd $HOME

git clone https://github.com/Ensembl/ensembl-git-tools.git
export PATH=$PWD/ensembl-git-tools/bin:$PATH

git ensembl --clone --checkout --branch release/${VER} api
git clone -b release-1-6-924 --depth 1 https://github.com/bioperl/bioperl-live.git

PROFILE=$(
cat <<- EOM

# Export Ensembl Perl APIs
PERL5LIB=\${PERL5LIB}:\${HOME}/bioperl-live
PERL5LIB=\${PERL5LIB}:\${HOME}/ensembl/modules
PERL5LIB=\${PERL5LIB}:\${HOME}/ensembl-compara/modules
PERL5LIB=\${PERL5LIB}:\${HOME}/ensembl-variation/modules
PERL5LIB=\${PERL5LIB}:\${HOME}/ensembl-funcgen/modules
export PERL5LIB
EOM
)

echo "$PROFILE" >> .bashrc
echo "$PROFILE" >> .bash_profile