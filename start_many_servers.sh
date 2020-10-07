#!/bin/bash
set -e

MYDIR=~/git/
GIT_REPOSITORIES_ARRAY=(repository1 \
                        repository2 \
                        repository3 \
                        repository4)

function start_servers () {
    num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
    for ((i = 0 ; i < num_repositories ; i++))
    do
        open -a iTerm .
        echo ""
        echo "starting $repository"
        repository=${GIT_REPOSITORIES_ARRAY[$i]}
        cd $MYDIR/$repository
        npm run start
    done
}
## TODO: Open a tab and run the command in this tab
start_servers
