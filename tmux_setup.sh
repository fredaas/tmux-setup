#!/usr/bin/env bash

set -e

tar -xzvf libevent-2.1.11-stable.tar.gz
tar -xzvf ncurses-6.2.tar.gz
tar -xzvf tmux-3.0a.tar.gz

mkdir -p local

# Install libevent
cd libevent-2.1.11-stable
./autogen.sh
./configure --prefix=${HOME}/local
make
make install
cd ..

# Install ncurses
cd ncurses-6.2
./configure --prefix=${HOME}/local
make
make install
cd ..

# Install tmux
cd tmux-3.0a
./configure --prefix=${HOME}/local \
    CFLAGS="-I${HOME}/local/include -I${HOME}/local/include/ncurses" \
    LDFLAGS="-L${HOME}/local/include -L${HOME}/local/include/ncurses -L${HOME}/local/lib"
make
make install
cd ..

echo "\n[SUCCESS] ${HOME}/install/bin/tmux is now avaiable"