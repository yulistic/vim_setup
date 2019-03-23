#!/bin/bash
git submodule update --init --recursive
mv ~/.vim ~/.vim.old && echo "~/.vim exists. It was moved to '~/.vim.old'. Remove it if not required."
mv ~/.vimrc ~/.vimrc.old && echo "~/.vimrc exists. It was moved to '~/.vimrc.old'. Remove it if not required."
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd) ~/.vim
