if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1="\[\033[1;34m\]nick@host\[\033[1;37m\]:[\033[1;32m\]\w\[\033[1;37m\]$\[\e[0m\] "
