Author: Jongyul Kim (yulistic@gmail.com)

After clone this project, make softlinks to proper location.
For example,
$ ln -s ~/vim_config ~/.vim
$ ln -s ~/vim_config/vimrc ~/.vimrc

To add new git based plugin, do following commands at ~/.vim (root of this git project).
1. git submodule add [git repository address] bundle/[plugin name] 
2. git submodule init
3. git submodule update
