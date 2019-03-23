#!/bin/bash
git submodule update --init --recursive
mv $HOME/.vim $HOME/.vim.old && echo "${HOME}/.vim exists. It was moved to '${HOME}/.vim.old'. Remove it if not required."
mv $HOME/.vimrc $HOME/.vimrc.old && echo "${HOME}/.vimrc exists. It was moved to '${HOME}/.vimrc.old'. Remove it if not required."
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd) $HOME/.vim
