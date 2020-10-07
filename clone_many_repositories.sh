#!/bin/bash
set -e

MYDIR=~/git/
GIT_REPOSITORIES_ARRAY=(repository1 \
                        repository2 \
                        repository3 \
                        repository4)


# Function that clones list of repositories defined on GIT_REPOSITORIES_ARRAY, and build each repository
function clone_and_build_repositories () {
    num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
    for ((i = 0 ; i < num_repositories ; i++))
    do
        repository=${GIT_REPOSITORIES_ARRAY[$i]}
        cd $MYDIR
        echo ""
        echo "Clonning $repository repository..."
        git clone <http://address>/$repository.git
        if [ $? = 0 ]
        then
            echo "Repository $repository clonned successfully"
        fi
        echo ""
        if [ -d $repository ]
        then
            cd $repository
            echo "Building repository $repository"
                yarn install
                yarn run build
        else
            echo "ERROR: Repository $repository missing on your git. Please clone try to clone it before run the script"
            echo ""
        fi    
    done

if [ $? = 0 ]
then
    echo ""
    echo "Repositories clonned and built successfully!"
fi
}

clone_and_build_repositories