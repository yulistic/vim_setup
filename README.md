# Vim Configuration Files
> Author: Jongyul Kim (yulistic@gmail.com)

## Cloning
To clone the project including all the submodules, do
```
$ git clone --recursive https://github.com/yulistic/vim_config.git
```
If you have already cloned to your local without submodules, do
```
$ git clone https://github.com/yulistic/vim_config.git
$ cd vim_config
$ git submodule update --init --recursive
```


## Tip for Basic Setting
After cloning this project, make softlinks to the proper location.
For example, if `vim_config` is in your home directory,

    $ ln -s ~/vim_config ~/.vim
    $ ln -s ~/vim_config/vimrc ~/.vimrc

## Add a New Vim Plugin
To add a new git based plugin, do the following commands at `~/.vim` (root of this git project).

    1. git submodule add [git repository address] bundle/[plugin name] 
    2. git submodule init
    3. git submodule update
