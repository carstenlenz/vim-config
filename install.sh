#!/bin/bash
if [[ -d $HOME/.vim ]]; then
    echo "'.vim' dir exists already! Please remove by hand if you really mean it."
    exit 1
fi
git clone https://github.com/carstenlenz/vim-config $HOME/.vim
git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
ln -s $HOME/.vim/vimrc $HOME/.vimrc
