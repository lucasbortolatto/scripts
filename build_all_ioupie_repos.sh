#!/bin/bash
set -e

IOUPIEDIR=~/git/ioupie
GIT_REPOSITORIES_ARRAY=(server-commons \
                        portaria-service \
                        bufunfa-service \
                        harvey-service \
                        louis-service \
                        postal-service \
                        ioupiemobileappexpo \
                        lms-app)


# Function that clones list of repositories defined on GIT_REPOSITORIES_ARRAY, and build each repository
function build_all_repositories () {
    num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
    for ((i = 0 ; i < num_repositories ; i++))
    do
        repository=${GIT_REPOSITORIES_ARRAY[$i]}
        cd $IOUPIEDIR
        echo "##############################################################################################################"
        echo ""
        if [ -d $repository ]
        then
            cd $repository
            echo "Building repository $repository"
            if [ "$repository" = "server-commons" ]
            then
                yarn install
                yarn run build
            elif [ "$repository" = "ioupiemobileappexpo" -o "$repository" = "lms-app" ]
            then
                yarn install
            else
                npm install
                npm run build
            fi
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