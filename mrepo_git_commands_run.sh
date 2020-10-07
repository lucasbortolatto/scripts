#!/bin/sh
# List of repositories
MYDIR=~/git/
GIT_REPOSITORIES_ARRAY=(repository1 \
                        repository2 \
                        repository3 \
                        repository4)

numRepositories=${#GIT_REPOSITORIES_ARRAY[@]}

function gitCommand () {
    for ((i = 0 ; i < numRepositories ; i++))
do
    module=${GIT_REPOSITORIES_ARRAY[$i]}
    cd $MYDIR
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
