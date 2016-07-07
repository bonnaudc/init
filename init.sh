#!/bin/bash

#---------------------------------------------------------------------------
#   CONFIGURATION DU SCRIPT 
#---------------------------------------------------------------------------
workspace=$HOME/workspace

printf "\nStarting script with workspace : $workspace..."

#---------------------------------------------------------------------------
#  UPDATE APT
#---------------------------------------------------------------------------
printf '\nUpdating apt...'
apt-get update

#---------------------------------------------------------------------------
# INSTALLATION DES PAQUETS
#---------------------------------------------------------------------------
printf '\nInstalling packages...'
apt-get install -y \
    vim \
    git \
    wget \
    curl

#---------------------------------------------------------------------------
#   CONFIG GIT
#---------------------------------------------------------------------------
printf '\nSetting git configuration...'
git config --global user.name "bonnaudc"                #set vim user name
git config --global user.email "bonnaudc@gmail.com"     #set vim user email
git config --global core.editor "vim"                   #use vim as editor for commit messages

#---------------------------------------------------------------------------
#   CREATION WORKSPACE  
#---------------------------------------------------------------------------
printf "\nCreating $workspace ..."
rm -rf $workspace && mkdir $workspace

#---------------------------------------------------------------------------
#   RECUP ALIASES
#---------------------------------------------------------------------------
printf '\nGetting vim configuration from Github...'
git clone https://github.com/bonnaudc/bash_aliases.git $workspace/bash_aliases
printf "\nCopying ~/.bash_aliases"
cp $workspace/bash_aliases/.bash_aliases ~/

#---------------------------------------------------------------------------
#   RECUP CONFIG VIM
#---------------------------------------------------------------------------
printf '\nGetting vim configuration from Github...'
git clone https://github.com/bonnaudc/vim_conf.git $workspace/vim_conf
printf "\nAdding links to ~/.vimrc and ~/.vim..."
unlink ~/.vimrc
unlink ~/.vim
ln -rs $workspace/vim_conf/.vimrc ~/
ln -rs $workspace/vim_conf/.vim ~/
printf "\nRunning git submodule init & update..."
git -C $workspace/vim_conf submodule init                   # git init submodules
git -C $workspace/vim_conf submodule update                   # git init submodules

#---------------------------------------------------------------------------
#   INSTALL METEOR
#---------------------------------------------------------------------------
printf '\nInstalling Meteor...'
curl https://install.meteor.com/ | sh

#---------------------------------------------------------------------------
#   RECUP myApp
#---------------------------------------------------------------------------
myApp=$workspace/myApp
printf "\nCloning myApp application into $myApp..."
git clone https://github.com/bonnaudc/myApp.git $myApp
printf '\nRunning meteor npm install...'
cd $myApp && meteor npm install
printf '\nUpdating Meteor...'
meteor update
