# Vim Configuration Files
> Author: Jongyul Kim (yulistic@gmail.com)

## Tip for Basic Setting
After cloning this project, make softlinks to the proper location.
For example,

    $ ln -s ~/vim_config ~/.vim
    $ ln -s ~/vim_config/vimrc ~/.vimrc

## Add a New Vim Plugin
To add a new git based plugin, do the following commands at `~/.vim` (root of this git project).

    1. git submodule add [git repository address] bundle/[plugin name] 
    2. git submodule init
    3. git submodule update
