#!/bin/bash
set -e

IOUPIEDIR=~/git/ioupie
GIT_REPOSITORIES_ARRAY=(portaria-service \
                        bufunfa-service \
                        harvey-service \
                        louis-service \
                        postal-service)

function start_servers () {
    num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
    for ((i = 0 ; i < num_repositories ; i++))
    do
        open -a iTerm .
        echo ""
        echo "starting $repository"
        repository=${GIT_REPOSITORIES_ARRAY[$i]}
        cd $IOUPIEDIR/$repository
        npm run start
    done
}
## TODO: Open a tab and run the command in this tab
start_servers
