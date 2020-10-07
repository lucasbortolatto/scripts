#!/bin/bash

# Script to build many repositories using yarn install in one go. 
# It's only needed to update the directory and the repository array with the repositories list
set -e

MYDIR=~/git/
GIT_REPOSITORIES_ARRAY=(repository1 \
                        repository2 \
                        repository3 \
                        repository4)


# Function that clones list of repositories defined on GIT_REPOSITORIES_ARRAY, and build each repository
function build_all_repositories () {
    num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
    for ((i = 0 ; i < num_repositories ; i++))
    do
        repository=${GIT_REPOSITORIES_ARRAY[$i]}
        cd $MYDIR
        echo "##############################################################################################################"
        echo ""
        if [ -d $repository ]
        then
            cd $repository
            echo "Building repository $repository"
                yarn install
                yarn run build

            echo "###############################################################################################################"
            echo "###############################################################################################################"
            cd ..
        else
            echo "ERROR: Repository $repository missing on your git. Please clone try to clone it before run the script"
            echo ""
        fi    
    done

if [ $? = 0 ]
then
    echo ""
    echo ""
    echo "####################################### All repositories are updated! #########################################"
    echo "###############################################################################################################"
    echo "###############################################################################################################"
fi
}

build_all_repositories