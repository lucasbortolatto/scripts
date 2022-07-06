# Personal aliases
# Created by Luidson Lucas Bortolatto
# Include general usage aliases
# 2022

function branchname () {
    git branch 2>/dev/null | grep -e '^*' | sed -E 's/^\* (.+)$/(\1) /'
}

function iosstart() {
    phoneModel=$1
    iosVersion=$2
    ios-sim start --devicetypeid "$1, $2"
}

function androidstart() {
    phoneModel=$1
    emulator -avd phoneModel &
}

# General alias
alias ll='ls -la'
alias devtools='cd $HOME/Documents/devTools'
alias editbash='vi ~/.bash_profile'
alias updatebash='source ~/.bash_profile'
alias listbash='cat ~/.bash_profile'
alias home='cd ~/'
alias gitdir='cd $HOME/git'
alias status='git status'
alias pull='git pull'
alias branch='git branch'
alias pod='pod install'
alias commit='git commit'
alias checkout='git checkout'


# IOS alias
alias iosshow='ios-sim showdevicetypes'

# Android alias
alias androidshow='emulator -list-avds'

# Personal specific alias
alias pdir='cd $HOME/git/pessoal'

#export JAVA_HOME=/Library/Java/Home
export PS1='\u@\H:\w $ '

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Android Variables
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# NVM Variables
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
