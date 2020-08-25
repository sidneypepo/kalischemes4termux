if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1="\[\033[32m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[32m\]\342\234\227\[\033]\342\224\200\")($(if [[ ${EUID} == 0 ]]; then echo '\[\033[1;34m\]root\[\033\㉿\h'; else echo '\[\033[1;34m\]nick\[\033\㉿host'; fi)\[\033[0;32m\])-[\[\033[1;37m\]\w\[\033[0;32m\]]\n\[\033[0;32m\]\342\224\224\342\224\200\342\224\200\[\033[0m\]\[\e[1;34m\]\\$\[\e[0m\] "
