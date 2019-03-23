#!/bin/bash
git submodule update --init --recursive
DIR_PATH="$HOME/.vim"
FILE_PATH="$HOME/.vimrc"
if [ -L $DIR_PATH ]; then
    rm -rf $DIR_PATH
elif [ -e $DIR_PATH ]; then
    mv $DIR_PATH ${DIR_PATH}.old && echo "${DIR_PATH} exists. It was moved to '${DIR_PATH}.old'. Remove it if not required."
fi

if [ -L $FILE_PATH ]; then
    rm -rf $FILE_PATH
elif [ -e $FILE_PATH ]; then
    mv $FILE_PATH ${FILE_PATH}.old && echo "${FILE_PATH} exists. It was moved to '${FILE_PATH}.old'. Remove it if not required."
fi
ln -s $(pwd)/vimrc $FILE_PATH
ln -s $(pwd) $DIR_PATH
