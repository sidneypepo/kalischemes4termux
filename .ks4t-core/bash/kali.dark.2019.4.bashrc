if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"

	}

fi

PS1="\[\033[1;31m\]user@host\[\e[0m\]:\[\033[1;34m\]\w\[\e[0m\]\$ "