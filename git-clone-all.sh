#!/bin/bash
REPOSITORIES=(product-api hscode-api visual-mapping-api label-api pim-bff image-generator label-event-publisher procen-excel-api product-content-editor-api product-event-publisher product-excel-api product-excel-api-consumer  auth-service pim-read-projector pim-read-api pim-storage-service pim-notification-service pim-web)
PIM_REPOSITORIES=(auth-service pim-read-projector pim-read-api pim-storage-service pim-notification-service pim-web)
if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n";'
  else
    mkdir src
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Cloning repository: $REPOSITORY
      echo ========================================================
      GROUP=procen
      for i in "${PIM_REPOSITORIES[@]}" ; do
        if [[ $REPOSITORY == $i ]] ; then
            GROUP=pim
        fi
      done
      REPO_URL=https://gitlab.trendyol.com/product/$GROUP/$REPOSITORY.git
      cd src
      git clone $REPO_URL
      cd ..
    done
fi