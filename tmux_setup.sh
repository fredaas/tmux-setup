#!/usr/bin/env bash

set -e

ROOT_DIR=${HOME}

cp -r libevent-2.1.11-stable.tar.gz ncurses-6.2.tar.gz tmux-3.0a.tar.gz ${ROOT_DIR}

cd ${ROOT_DIR}

tar -xzvf libevent-2.1.11-stable.tar.gz
tar -xzvf ncurses-6.2.tar.gz
tar -xzvf tmux-3.0a.tar.gz

mkdir -p local

# Install libevent
cd libevent-2.1.11-stable
./autogen.sh
./configure --prefix=${ROOT_DIR}/local
make
make install
cd ..

# Install ncurses
cd ncurses-6.2
./configure --prefix=${ROOT_DIR}/local
make
make install
cd ..

# Install tmux
cd tmux-3.0a
./configure --prefix=${ROOT_DIR}/local \
    CFLAGS="-I${ROOT_DIR}/local/include -I${ROOT_DIR}/local/include/ncurses" \
    LDFLAGS="-L${ROOT_DIR}/local/include -L${ROOT_DIR}/local/include/ncurses -L${ROOT_DIR}/local/lib"
make
make install
cd ..

# Clean up
rm -rf libevent-2.1.11-stable*
rm -rf ncurses-6.2*
rm -rf tmux-3.0a*

echo "[SUCCESS] ${ROOT_DIR}/local/bin/tmux is now available"
