#!/usr/bin/env bash

export VIM_REPO="https://github.com/KMK-ONLINE/vim-config.git"
export VIM_INSTALL_DIR="${HOME}/.vim-config"
export VIM_DIR="${HOME}/.vim"

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

# create symlinks
ln -sf "${VIM_INSTALL_DIR}/.vim" $VIM_DIR
ln -sf "${VIM_INSTALL_DIR}/.vimrc" ~/.vimrc
ln -sf "${VIM_INSTALL_DIR}/.gvimrc" ~/.gvimrc

curl -fLo "${VIM_DIR}/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install bundle with Plug
vim +PlugInstall +qall
