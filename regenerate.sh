#!/bin/bash
# Source: https://github.com/jecnua/terraform-module-generator
# Owner: jecnua <fabrizio.sabatini.it@gmail.com>
# License: MIT
# Usage:
# ./regenerate.sh

RED='\033[0;31m'
NC='\033[0m' # No Color

cd modules || exit
for a_directory in `ls -d */`
do
  (
  cd $a_directory || exit
  if [ ! -f "README.md" ]; then
    touch README.md
  fi
  dir_name=`echo $a_directory | sed 's:/*$::'`
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    terraform init
    terraform get
  else
    printf "$RED $dir_name: terraform validate failed. $NC \n"
  fi
  terraform-docs md "`pwd`" > "`pwd`"/params.md
  echo "$dir_name: params regenerated"
  )
done
