#---------------------------------------------------------------------------
#   CONFIGURATION DU SCRIPT 
#---------------------------------------------------------------------------
workspace=$HOME/workspace

#---------------------------------------------------------------------------
#  UPDATE APT
#---------------------------------------------------------------------------
apt-get update

#---------------------------------------------------------------------------
# INSTALLATION DES PAQUETS
#---------------------------------------------------------------------------
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
git config --global user.name "bonnaudc"                #set vim user name
git config --global user.email "bonnaudc@gmail.com"     #set vim user email
git config --global core.editor "vim"                   #use vim as editor for commit messages

#---------------------------------------------------------------------------
#   CREATION WORKSPACE  
#---------------------------------------------------------------------------
mkdir $workspace

#---------------------------------------------------------------------------
#   RECUP ALIASES
#---------------------------------------------------------------------------
git clone https://github.com/bonnaudc/bash_aliases.git $workspace/bash_aliases
unlink ~/.bash_aliases
ln -rs $worskpace/bash_aliases/.bash_aliases ~/
source ~/.bash_aliases

#---------------------------------------------------------------------------
#   RECUP CONFIG VIM
#---------------------------------------------------------------------------
git clone https://github.com/bonnaudc/vim_conf.git $workspace/vim_conf
unlink ~/.vimrc
unlink ~/.vim
ln -rs $workspace/vim_conf/.vimrc ~/
ln -rs $workspace/vim_conf/.vim ~/


#---------------------------------------------------------------------------
#   RECUP myApp
#---------------------------------------------------------------------------
git clone https://github.com/bonnaudc/myApp.git $workspace/myApp



#curl https://install.meteor.com/ | sh


#meteor update
#mkdir /workspace && cd /workspace
#meteor create myApp && cd myApp
#rm client/main.*
#mkdir -p client/lib/semantic-ui/
#meteor  npm install react react-dom react-router material-ui
#meteor add  meteor:mocha mdg:validated-method dburles:factory dburles:factory aldeed:collection2 mongo practicalmeteor:chai
