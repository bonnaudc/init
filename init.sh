#---------------------------------------------------------------------------
#   CONFIGURATION DU SCRIPT 
#---------------------------------------------------------------------------
workspace=$HOME/workspace

echo '\nStarting script with workspace : $workspace...'

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
    nodejs \
    npm \
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
echo '\nCreating $workspace ...'
rm -rf $workspace && mkdir $workspace

#---------------------------------------------------------------------------
#   RECUP ALIASES
#---------------------------------------------------------------------------
echo '\nGetting vim configuration from Github...'
git clone https://github.com/bonnaudc/bash_aliases.git $workspace/bash_aliases
unlink ~/.bash_aliases
ln -rs $workspace/bash_aliases/.bash_aliases ~/
source ~/.bash_aliases

#---------------------------------------------------------------------------
#   RECUP CONFIG VIM
#---------------------------------------------------------------------------
echo '\nGetting vim configuration from Github...'
git clone https://github.com/bonnaudc/vim_conf.git $workspace/vim_conf
unlink ~/.vimrc
unlink ~/.vim
ln -rs $workspace/vim_conf/.vimrc ~/
ln -rs $workspace/vim_conf/.vim ~/
git -C $workspace/vim_conf submodule init                   # git init submodules
git -C $workspace/vim_conf submodule update                   # git init submodules

#---------------------------------------------------------------------------
#   RECUP myApp
#---------------------------------------------------------------------------
echo '\nGetting myApp application...'
git clone https://github.com/bonnaudc/myApp.git $workspace/myApp



#curl https://install.meteor.com/ | sh


#meteor update
#mkdir /workspace && cd /workspace
#meteor create myApp && cd myApp
#rm client/main.*
#mkdir -p client/lib/semantic-ui/
#meteor  npm install react react-dom react-router material-ui
#meteor add  meteor:mocha mdg:validated-method dburles:factory dburles:factory aldeed:collection2 mongo practicalmeteor:chai
