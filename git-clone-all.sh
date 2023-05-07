#!/bin/bash
REPOSITORIES=(product-api hscode-api visual-mapping-api label-api pim-bff image-generator label-event-publisher procen-excel-api product-content-editor-api product-event-publisher product-excel-api product-excel-api-consumer)
PIM_REPOSITORIES=(auth-service pim-read-projector pim-read-api pim-storage-service pim-notification-service pim-web)
if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n";'
    echo ${PIM_REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n";'
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

    for PIM_REPOSITORY in ${PIM_REPOSITORIES[*]}
    do
      echo ========================================================
      mkdir src
      echo Cloning repository: $PIM_REPOSITORY
      echo ========================================================
      REPO_URL=https://gitlab.trendyol.com/product/pim/$PIM_REPOSITORY.git
      cd src
      git clone $REPO_URL
      cd ..
    done
fi