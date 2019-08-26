#!/bin/bash
echo -n "Check vim plugin install.. "
if test ! -d ~/.vim/bundle/Vundle.vim; then
    echo;
    git clone https://github.com/VundleVim/Vundle.vim.git;
    vim -c :PluginInstall <<EOF 
    ZZ
EOF
else
    echo "[OK]"
fi

echo -n "Check ctags install.. "
if test ! -f /bin/ctags && test ! -f /usr/bin/ctags; then
    echo;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list /etc/apt/sources.list.d/dzos-sources.list.bak;
    sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
    sudo apt-get update;
    sudo apt-get -f upgrade;
    sudo apt-get -y install ctags;
    sudo rm -f /etc/apt/sources.list.d/dzos-sources.list;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
else
    echo "[OK]"
fi

echo -n "Check cscope install.. "
if test ! -f /bin/cscope && test ! -f /usr/bin/cscope; then
    echo;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list /etc/apt/sources.list.d/dzos-sources.list.bak;
    sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
    sudo apt-get update;
    sudo apt-get -f upgrade;
    sudo apt-get -y install cscope;
    sudo rm -f /etc/apt/sources.list.d/dzos-sources.list;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
else
    echo "[OK]"
fi
