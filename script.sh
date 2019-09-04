#!/bin/bash
echo -n "Check vim vumdle install.. "
if test ! -d ~/.vim/bundle/Vundle.vim; then
    echo;
    git clone https://github.com/VundleVim/Vundle.vim.git;
else
    echo "[OK]"
fi

echo -n "Check ctags install.. "
if test ! -f /bin/ctags && test ! -f /usr/bin/ctags; then
    echo;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list /etc/apt/sources.list.d/dzos-sources.list.bak;
    sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
    sudo apt-get -y update;
    sudo apt-get -f -y upgrade;
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
    sudo apt-get -y update;
    sudo apt-get -f -y upgrade;
    sudo apt-get -y install cscope;
    sudo rm -f /etc/apt/sources.list.d/dzos-sources.list;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
else
    echo "[OK]"
fi

echo -n "Check bashrc.. "
if test ! -f /etc/bashrc; then
    if test ! -f bashrc; then
        echo "[fail]"
    else
        sudo cp bashrc /etc/bashrc;
        source ~/.bashrc;
        echo "[installed]"
    fi
else
    echo "[OK]"
fi

echo -n "Check colordiff install.. "
if test ! -f /bin/colordiff && test ! -f /usr/bin/colordiff; then
    echo;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list /etc/apt/sources.list.d/dzos-sources.list.bak;
    sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
    sudo apt-get -y update;
    sudo apt-get -f -y upgrade;
    sudo apt-get -y install colordiff;
    sudo rm -f /etc/apt/sources.list.d/dzos-sources.list;
    sudo mv /etc/apt/sources.list.d/dzos-sources.list.bak /etc/apt/sources.list.d/dzos-sources.list;
else
    echo "[OK]"
fi

