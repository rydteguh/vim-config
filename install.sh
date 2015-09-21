#!/usr/bin/env bash

export VIM_REPO="https://github.com/KMK-ONLINE/vim-config.git"
export VIM_INSTALL_DIR="${HOME}/.vim-config"
export VIM_DIR="${HOME}/.vim"
export VUNDLE_DIR="${VIM_INSTALL_DIR}/.vim/bundle/Vundle.vim"
export VUNDLE_REPO="https://github.com/VundleVim/Vundle.vim"

# fix some flacky when on home
cd /tmp

# clean up
if [ -d $VIM_DIR ]; then
  rm -rf $VIM_DIR
fi
if [ -d $VIM_INSTALL_DIR ]; then
  rm -rf $VIM_INSTALL_DIR
fi

git clone $VIM_REPO $VIM_INSTALL_DIR;
git clone $VUNDLE_REPO $VUNDLE_DIR;

# create symlinks
ln -sf "${VIM_INSTALL_DIR}/.vim" $VIM_DIR
ln -sf "${VIM_INSTALL_DIR}/.vimrc" ~/.vimrc
ln -sf "${VIM_INSTALL_DIR}/.gvimrc" ~/.gvimrc

# Install bundle with vundle
vim +BundleInstall +qall
