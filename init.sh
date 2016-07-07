#!/bin/bash

#---------------------------------------------------------------------------
#   CONFIGURATION DU SCRIPT 
#---------------------------------------------------------------------------
workspace=$HOME/workspace

echo "\nStarting script with workspace : $workspace..."

#---------------------------------------------------------------------------
#  UPDATE APT
#---------------------------------------------------------------------------
echo '\nUpdating apt...'
apt-get update

#---------------------------------------------------------------------------
# INSTALLATION DES PAQUETS
#---------------------------------------------------------------------------
echo '\nInstalling packages...'
apt-get install -y \
    vim \
    git \
    wget \
    curl

#---------------------------------------------------------------------------
#   CONFIG GIT
#---------------------------------------------------------------------------
echo '\nSetting git configuration...'
git config --global user.name "bonnaudc"                #set vim user name
git config --global user.email "bonnaudc@gmail.com"     #set vim user email
git config --global core.editor "vim"                   #use vim as editor for commit messages

#---------------------------------------------------------------------------
#   CREATION WORKSPACE  
#---------------------------------------------------------------------------
echo "\nCreating $workspace ..."
rm -rf $workspace && mkdir $workspace

#---------------------------------------------------------------------------
#   RECUP ALIASES
#---------------------------------------------------------------------------
echo '\nGetting vim configuration from Github...'
git clone https://github.com/bonnaudc/bash_aliases.git $workspace/bash_aliases
echo "\nAdding links to ~/.bash_aliases"
unlink ~/.bash_aliases
ln -rs $workspace/bash_aliases/.bash_aliases ~/
echo "\nSourcing  ~/.bash_aliases"
source ~/.bash_aliases

#---------------------------------------------------------------------------
#   RECUP CONFIG VIM
#---------------------------------------------------------------------------
echo '\nGetting vim configuration from Github...'
git clone https://github.com/bonnaudc/vim_conf.git $workspace/vim_conf
echo "\nAdding links to ~/.vimrc and ~/.vim..."
unlink ~/.vimrc
unlink ~/.vim
ln -rs $workspace/vim_conf/.vimrc ~/
ln -rs $workspace/vim_conf/.vim ~/
echo "\nRunning git submodule init & update..."
git -C $workspace/vim_conf submodule init                   # git init submodules
git -C $workspace/vim_conf submodule update                   # git init submodules

#---------------------------------------------------------------------------
#   INSTALL METEOR
#---------------------------------------------------------------------------
echo '\nInstalling Meteor...'
curl https://install.meteor.com/ | sh

#---------------------------------------------------------------------------
#   RECUP myApp
#---------------------------------------------------------------------------
myApp=$workspace/myApp
echo "\nCloning myApp application into $myApp..."
git clone https://github.com/bonnaudc/myApp.git $myApp
echo '\nRunning meteor npm install...'
cd $myApp && meteor npm install
echo '\nUpdating Meteor...'
meteor update
