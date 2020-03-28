#!/bin/bash
set -e

IOUPIEDIR=~/git/ioupie
GIT_REPOSITORIES_ARRAY=(server-commons \
                        portaria-service \
                        bufunfa-service \
                        harvey-service \
                        louis-service \
                        ioupiemobileappexpo)


# Function that clones list of repositories defined on GIT_REPOSITORIES_ARRAY, and build each repository
function clone_and_build_repositories () {
    num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
    for ((i = 0 ; i < num_repositories ; i++))
    do
        repository=${GIT_REPOSITORIES_ARRAY[$i]}
        cd $IOUPIEDIR
        echo ""
        echo "Clonning $repository repository..."
        git clone https://gitlab.com/ioupie/$repository.git
        if [ $? = 0 ]
        then
            echo "Repository $repository clonned successfully"
        fi
        echo ""
        if [ -d $repository ]
        then
            cd $repository
            echo "Building repository $repository"
            if [ "$repository" = "server-commons" ]
            then
                yarn install
                yarn run build
            elif [ "$repository" = "ioupiemobileappexpo" ]
            then
                yarn install
            else
                npm install
                npm run build
            fi
            cd ..
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