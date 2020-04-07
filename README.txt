Install:

    $ ./tmux_install.sh

Update paths:

    $ export PATH=${HOME}/local/bin:$PATH

    $ export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

Check dependecies:

    $ ldd $(which tmux)

If you're not happy with the tarballs provided in this repo, you can find
alternatives here:

    https://github.com/tmux/tmux/releases

    https://github.com/libevent/libevent/releases

    https://invisible-mirror.net/archives/ncurses/
