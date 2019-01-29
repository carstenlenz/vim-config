#!/bin/bash
if [[ -d $HOME/.vim ]]; then
    echo "'.vim' dir exists already! Please remove by hand if you really mean it."
    exit 1
fi
git clone https://github.com/carstenlenz/vim-config $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
#vim +PluginInstall +qall
