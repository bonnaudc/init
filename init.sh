#---------------------------------------
#   CONFIGURATION DU SCRIPT 
#---------------------------------------
workspace=$HOME/workspace

#---------------------------------------
#  UPDATE APT
#---------------------------------------
apt-get update

#---------------------------------------
# INSTALLATION DES PAQUETS
#---------------------------------------
apt-get install -y \
    nodejs \
    npm \
    vim \
    git \
    wget \
    curl

#---------------------------------------
#   CONFIG GIT
#---------------------------------------
git config --global user.name "bonnaudc"


#---------------------------------------
#   CREATION WORKSPACE  
#---------------------------------------
mkdir $workspace

#---------------------------------------
#   RECUP ALIASES
#---------------------------------------
git clone https://github.com/bonnaudc/bash_aliases.git $workspace
ln -rs $worskpace/bash_aliases/bash_aliases ~/
source ~/.bash_aliases

#---------------------------------------
#   RECUP CONFIG VIM
#---------------------------------------
git clone https://github.com/bonnaudc/vim_conf.git $workspace
ln -rs $workspace/vim_conf/.vimrc ~/
ln -rs $workspace/vim_conf/.vim ~/

#curl https://install.meteor.com/ | sh


#meteor update
#mkdir /workspace && cd /workspace
#meteor create myApp && cd myApp
#rm client/main.*
#mkdir -p client/lib/semantic-ui/
#meteor  npm install react react-dom react-router material-ui
#meteor add  meteor:mocha mdg:validated-method dburles:factory dburles:factory aldeed:collection2 mongo practicalmeteor:chai
