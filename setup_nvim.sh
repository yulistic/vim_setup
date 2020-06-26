#!/bin/bash

DIR_PATH="$HOME/.config/nvim"
mkdir -p $DIR_PATH

# For deoplete.nvim
# sudo pip install msgpack
# pip3 install --user --upgrade pynvim

# For coc.nvim
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
# sudo curl -sL install-node.now.sh/lts | bash     # Install nodejs.

# nvim config file.
FILE_PATH="$DIR_PATH/init.vim"
if [ -L $FILE_PATH ]; then
    rm -rf $FILE_PATH
elif [ -e $FILE_PATH ]; then
    mv $FILE_PATH ${FILE_PATH}.old && echo "${FILE_PATH} exists. It was moved to '${FILE_PATH}.old'. Remove it if not required."
fi
ln -s $(pwd)/init.vim $FILE_PATH

# coc.nvim config file.
FILE_PATH="$DIR_PATH/coc-settings.json"
if [ -L $FILE_PATH ]; then
    rm -rf $FILE_PATH
elif [ -e $FILE_PATH ]; then
    mv $FILE_PATH ${FILE_PATH}.old && echo "${FILE_PATH} exists. It was moved to '${FILE_PATH}.old'. Remove it if not required."
fi
ln -s $(pwd)/coc-settings.json $FILE_PATH
