#!/bin/bash

#---------------------------------------------------------------------------
#   CONFIGURATION DU SCRIPT 
#---------------------------------------------------------------------------
workspace=$HOME/workspace

printf "\nStarting script with workspace : $workspace..."

#---------------------------------------------------------------------------
#  UPDATE APT
#---------------------------------------------------------------------------
printf '\nUpdating apt...\n'
apt-get update

#---------------------------------------------------------------------------
# INSTALLATION DES PAQUETS
#---------------------------------------------------------------------------
printf '\nInstalling packages...\n'
apt-get install -y \
    nodejs \
    npm \
    default-jdk \
    default-jre \
    git \
    wget \
    curl \
    default-jre \
    default-jdk \
    vim-nox \
    vim
    
printf '\nAdding link to /usr/bin/node...\n'
ln -s /usr/bin/nodejs /usr/bin/node
#---------------------------------------------------------------------------
#   CONFIG GIT
#---------------------------------------------------------------------------
printf '\nSetting git configuration...\n'
git config --global core.editor "vim"                   #use vim as editor for commit messages

#---------------------------------------------------------------------------
#   CREATION WORKSPACE  
#---------------------------------------------------------------------------
printf "\nCreating $workspace ...\n"
rm -rf $workspace && mkdir $workspace

#---------------------------------------------------------------------------
#   RECUP ALIASES
#---------------------------------------------------------------------------
printf '\nGetting vim configuration from Github...\n'
git clone https://github.com/cyrillebonnaud/bash_aliases.git $workspace/bash_aliases
printf "\nCopying ~/.bash_aliases\n"
cp $workspace/bash_aliases/.bash_aliases ~/
printf "\nDeleting $workspace/bash_aliases\n"
rm -rf $workspace/bash_aliases

#---------------------------------------------------------------------------
#   RECUP CONFIG VIM
#---------------------------------------------------------------------------
printf '\nGetting vim configuration from Github...\n'
git clone https://github.com/cyrillebonnaud/vim_conf.git $workspace/vim_conf
printf "\nAdding links to ~/.vimrc and ~/.vim...\n"
unlink ~/.vimrc
unlink ~/.vim
ln -rs $workspace/vim_conf/.vimrc ~/
ln -rs $workspace/vim_conf/.vim ~/
printf "\nRunning git submodule init & update...\n"
git -C $workspace/vim_conf submodule init                   # git init submodules
git -C $workspace/vim_conf submodule update                   # git init submodules

#---------------------------------------------------------------------------
#   INSTALL METEOR
#---------------------------------------------------------------------------
printf '\nInstalling Meteor...\n'
curl https://install.meteor.com/ | sh

#---------------------------------------------------------------------------
#   RECUP myApp
#---------------------------------------------------------------------------
myApp=$workspace/myApp
printf "\nCloning myApp application into $myApp...\n"
git clone https://github.com/cyrillebonnaud/myApp.git $myApp
printf '\nRunning npm install...\n'
cd $myApp && npm install
printf '\nUpdating Meteor...\n'
meteor update
