#!/bin/sh
# List of repositories
IOUPIEDIR=~/git/ioupie
GIT_REPOSITORIES_ARRAY=(server-commons \
                        portaria-service \
                        bufunfa-service \
                        harvey-service \
                        louis-service \
                        postal-service \
                        ioupiemobileappexpo \
                        lms-app)

numRepositories=${#GIT_REPOSITORIES_ARRAY[@]}

function gitCommand () {
    for ((i = 0 ; i < numRepositories ; i++))
do
    module=${GIT_REPOSITORIES_ARRAY[$i]}
    cd $IOUPIEDIR
    echo "#############################################################################################################"
    echo ""
    echo "Running command $command on $module repository..."
    echo ""
    if [ -d $module ]
    then
        cd $module
        echo "$module"
        echo "$command"
        echo ""
        $command
        echo ""    
    else
        echo "ERROR: Repository $module missing on your git. Please clone it if is needed for your projects"
        echo ""
    fi
done
echo "###############################################################################################################"
echo "###############################################################################################################"
}

echo "################################## Multiple repositories commands run Script ##################################"
echo "###############################################################################################################"
echo "###############################################################################################################"
echo "Type git command you want to use in all repos (i.e. git status, git checkout "

read command
gitCommand "$command"
