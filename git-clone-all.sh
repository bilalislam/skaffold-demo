#!/bin/bash
REPOSITORIES=(product-api hscode-api visual-mapping-api label-api)
if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n";'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      mkdir src
      echo Cloning repository: $REPOSITORY
      echo ========================================================
      REPO_URL=https://gitlab.trendyol.com/product/procen/$REPOSITORY.git
      cd src
      git clone $REPO_URL
      cd ..
    done
fi