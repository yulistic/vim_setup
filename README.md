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

## Delete submodule
```
git submodule deinit <path_to_submodule>
git rm <path_to_submodule>
git commit -m "Removed submodule "
rm -rf .git/modules/<path_to_submodule>
```

For example, to remove `SrcExpl`
```
git submodule   # For listing.
git submodule deinit bundle/SrcExpl
git rm bundle/SrcExpl
git commit -m "Remove SrcExpl"
rm -rf ../.git/modules/vim/modules/bundle/SrcExpl
```
