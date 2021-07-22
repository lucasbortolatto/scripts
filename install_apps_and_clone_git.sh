#!/bin/bash

# ## TODO: Verify how to use user admin password and user gitlab login

# Directory to be created to store git repositories
GITDIR=$HOME/git/

PERSGITDIR=$GITDIR/personal-repos

# # List of repositories to be clonned from gitlab
# # GIT_REPOSITORIES_ARRAY=(testrepository \
# #                         testrepository2)

# List of softwares to download using home brew (Apps that can be installed using command line)
BREW_INSTALL_ARRAY=(gzip \
                    zip)

# # # List of softwares to download using home brew cask (Gui macOS Applications)
# # BREW_INSTALL_CASK_ARRAY=(firefox \
# #                         sublime-text)

# #List of repositories to be clonned from gitlab
# GIT_REPOSITORIES_ARRAY=(android \
#                         backend \
#                         ios)

# List of softwares to download using home brew (Apps that can be installed using command line)
BREW_INSTALL_ARRAY=(git)

# # List of softwares to download using home brew cask (Gui macOS Applications)
# BREW_INSTALL_CASK_ARRAY=(iterm2 \
#                     android-studio \
#                     microsoft-teams \
#                     postman \
#                     visual-studio-code \
#                     google-chrome \
#                     skype \
#                     onedrive \
#                     sublime-text \
#                     todoist \
#                     slack \
#                     spotify)

function install_apps () {
    num_apps=${#BREW_INSTALL_ARRAY[@]}
    for ((i = 0 ; i < num_apps ; i++))
    do
        current_app=${BREW_INSTALL_ARRAY[$i]}
        echo "Installing $current_app..."
        brew install $current_app
        if [ $? = 0 ]
        then
            echo "$current_app successfully installed"
        fi
    done
}

function install_gui_apps () {
    num_apps=${#BREW_INSTALL_CASK_ARRAY[@]}
    for ((i = 0 ; i < num_apps ; i++))
    do
        current_app=${BREW_INSTALL_CASK_ARRAY[$i]}
        echo "Installing $current_app..."
        brew cask install $current_app
        if [ $? = 0 ]
        then
            echo "$current_app successfully installed"
        fi
    done
}

# # Function that clones list of repositories defined on GIT_REPOSITORIES_ARRAY, checkout to development branch and run a git pull.
# function clone_and_update_project_repositories () {
#     num_repositories=${#GIT_REPOSITORIES_ARRAY[@]}
#     for ((i = 0 ; i < num_repositories ; i++))
#     do

#         repository=${GIT_REPOSITORIES_ARRAY[$i]}
#         cd $HSFGITDIR
#         echo "Clonning $repository repository..."

#         git clone <repository>
#         if [ $? = 0 ]
#         then
#             echo "Repository $repository clonned successfully"
#         fi
#         echo ""
#         if [ -d $repository ]
#         then
#             cd $repository
#             echo "Changing to development branch..."
#             git checkout development
#             echo "Updating repository $repository..."
#             git pull
#         else
#             echo "ERROR: Repository $repository missing on your git. Please clone try to clone it before run the script"
#             echo ""
#         fi    

#     done
# }

#read -p "Type your gitlab username:" gitlab_username

# Script stops the execution if in case of execution error

echo "Checking if Homebrew is installed..."
which -s brew
if [ $? != 0 ]
then
    # Install Homebrew
    echo "Homebrew installation not found. Starting to install..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Installing brew cask..."
    brew install caskroom/cask/brew-cask
else
    echo "Homebrew installation found. Trying to update Homebrew..."
    brew update
fi

set -e
# Installing Apps with brew install
install_apps

# Install GUI Apps with brew cask install
install_gui_apps

echo "Showing apps installed by Brew..."
echo "Brew:"
brew list
echo ""
echo "Showing apps installed by Brew cask..."
brew cask list
echo ""



#Clone personal repo and copy, rename, update  .bash_profile 
echo "Creating git folder to store  personal repositories..."
cd $GITDIR
echo "Clonning personal repositories"
mkdir -p $PERSGITDIR
cd $PERSGITDIR 
#git clone <repository>
cd $HOME
# echo "Copying personal bash profile..."
# cp $GITDIR/personal-repos/scripts/.bash_profile_luidson .
# echo "Renaming personal bash profile"
# mv .bash_profile_luidson .bash_profile
# mv .bash_profileluidson .bash_profile
# source $HOME/.bash_profile

# create ssh key to be userd on git lab accounts
# cd $HOME
# echo "Creating a ssh key to use on gitlab..."
# ssh-keygen -t rsa -b 4096 -C “$gitlab_username“
# echo "Displaying the ssh key. Copy it and paste in your gitlab User Settings"
# echo ""
# echo ""
# cat $HOME/.ssh/id_rsa.pub
