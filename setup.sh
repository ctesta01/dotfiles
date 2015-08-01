#!/bin/bash

# This is written to setup these dotfiles for a
# user on a centos box, and haven't been tested anywhere else.

echo -e "\n\e[38;5;198mWARNING: This will overwrite your dotfiles (.bashrc, .vimrc, .gitconfig, .tmux.conf)\e[39m" 
read -rsp $'Press any key to continue...\n' -n1 key

# Testa's Setup Script
#
# Start Date: July 20, 2015
#
#   Table of Contents:
#   =================
#
# cbd39  Alias + Writing Personal Configurations
# c9abf  Installing Dependencies 
# 5b62a  Sourcing Public Configurations
#
#   To Do:
#   write c9abf


# cbd39  Alias + Writing Personal Configurations
# 
ln -fs ~/dotfiles/.bashrc ~/.bashrc
ln -fs ~/dotfiles/.vimrc ~/.vimrc
ln -fs ~/dotfiles/.gitconfig ~/.gitconfig
ln -fs ~/dotfiles/.tmux.conf ~/.tmux.conf


# c9abf  Installing Dependencies 
#           not listed in any particular order
#
sudo yum -y install vim
sudo yum -y install tree
sudo yum -y groupinstall "Development tools"
sudo yum -y install nginx
sudo yum -y install gcc gcc-c++
sudo yum -y install git
sudo yum -y install yum-utils
sudo yum -y install python-virtualenv
sudo yum -y install epel-release
sudo yum -y install python-virtualenvwrapper
sudo yum -y install postgresql postgresql-server postgresql-contrib
sudo rpm -iUvh http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
sudo yum-builddep -y postgresql93-server
sudo yum -y install postgresql93 postgresql93-server postgresql93-contrib postgresql93-libs --disablerepo=* --enablerepo=pgdg93
sudo systemctl enable postgresql-9.3
sudo /usr/pgsql-9.3/bin/postgresql93-setup initdb
sudo yum-builddep -y python-psycopg2
sudo chown -R postgres:postgres /var/run/postgresql/
sudo yum -y install postgresql-devel


# 5b62a  Sourcing Public Configurations
#
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/wincent/Command-T.git

