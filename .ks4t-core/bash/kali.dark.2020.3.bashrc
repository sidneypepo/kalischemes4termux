if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"

	}

fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]user@host\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '