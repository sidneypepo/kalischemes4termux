#!/bin/bash

#Credits:
#  _                              _    __
# | |                            | |  /  |
# | | _  _   _     ___ _   _  ___| | /_/ |____
# | || \| | | |   /___) | | |/___) || \| |  _ \
# | |_) ) |_| |  |___ | |_| |___ | |_) ) | | | |
# |____/ \__  |  (___/ \__  (___/|____/|_|_| |_|
#       (____/        (____/

#Banner function:
banner()
{

	clear

	#Script banner:
	echo -e " \e[1;34m_     _       _  _    \e[1;35m______       _                            "
	echo -e "\e[1;34m| |   | |     | |(_)  \e[1;35m/ _____)     | |                           "
	echo -e "\e[1;34m| |___| |_____| | _  \e[1;35m( (____   ____| |__  _____ ____  _____  ___ "
	echo -e "\e[1;34m|  _   /\____ | || |  \e[1;35m\____ \ / ___)  _ \| ___ |    \| ___ |/___)"
	echo -e "\e[1;34m| |  \ \/ ___ | || |  \e[1;35m_____) | (___| | | | ____| | | | ____|___ |"
	echo -e "\e[1;34m|_|   \_)_____|\_)_| \e[1;35m(______/ \____)_| |_|_____)_|_|_|_____|___/ "
	echo -e " \e[1;33m_     _   \e[1;37m_______                                               "
	echo -e "\e[1;33m| |   | | \e[1;37m(__   __)                                              "
	echo -e "\e[1;33m| |___| |    \e[1;37m| |_____  ____ ____  _   _ _   _                    "
	echo -e "\e[1;33m|_____  |    \e[1;37m| | ___ |/ ___)    \| | | ( \ / )                   "
	echo -e "\e[1;33m      | |    \e[1;37m| | ____| |   | | | | |_| |) X (                    "
	echo -e "\e[1;33m      |_|    \e[1;37m|_|_____)_|   |_|_|_|____/(_/ \_)                   "
	echo -e "\n\e[0;32m────────────────────── 「\e[1;32mC0d3d \e[0;37mby \e[1;31msysb1n\e[1;34m \e[0;32m」──────────────────────\e[0m\n"

}

#Reset Termux scheme function:
reset()
{

	#Executing banner function:
	banner

	sleep 1

	echo -e "    \e[1;33m[*] Reseting Termux scheme...\e[0m"
	rm -rf "$HOME/../usr/bin/colors.properties" "$HOME/../usr/bin/font.ttf"
	rm -rf "$HOME/.termux" "$HOME/.oh-my-zsh" "$HOME/.zshrc" "$HOME/.zsh-syntax-highlighting"
	chsh -s bash
	termux-reload-settings
	sleep 1

	#Executing banner function:
	banner
	echo -e "    \e[1;32m[+] Termux scheme successfully reseted.\e[0m\n"
	sleep 1
	echo -e "    \e[1;33m[*] Restart your Termux to the changes run properly.\e[0m\n"
	sleep 5
	#Executing main menu function:
	menu

}

apply()
{

	#Executing banner function:
	banner

	#Checking if core is in home:
	if [ -d "$HOME/.termux" ]
	then

		mv "$HOME/.termux" "$HOME/.termux.$(date).bak"

	fi
	cp -r ".ks4t-core" "$HOME/.termux"
	
	sleep 1

	#Checking if zsh is installed
	if [ -x "$(command -v zsh)" ]
	then

		echo -e "    \e[1;32m[+] Zsh is instaled.\e[0m\n"

	else
		echo -e "    \e[1;31m[!] Zsh isn't instaled. Installing it...\e[0m"
		apt install -q zsh -y
		sleep 1

		if [ -x "$(command -v zsh)" ]
		then

			echo -e "    \e[1;32m[+] Zsh instaled.\e[0m\n"

		else

			echo -e "    \e[1;31m[!] Zsh can't be instaled. Run 'apt update -y && apt upgrade -y' before use this script.\n\n    Exiting...\e[0m"
			sleep 3
			exit
		fi

	fi

	sleep 1

	#Checking if oh-my-zsh is installed:
	omz=.oh-my-zsh/
	if [ -d "$omz" ]
	then

		echo -e "    \e[1;32m[+] Oh-my-zsh is instaled.\e[0m\n"

		#The following code is from https://github.com/Cabbagec/termux-ohmyzsh/blob/master/install.sh:
		if [ -f "$HOME/.zshrc" ]
		then

			mv "$HOME/.zshrc" "$HOME/.zshrc.$(date).bak"

		fi
		if [ -d "$HOME/.oh-my-zsh" ]
                then

                        mv "$HOME/.oh-my-zsh" "$HOME/.oh-my-zsh.$(date).bak"

                fi
		cp -r ".oh-my-zsh" "$HOME/.oh-my-zsh"

		cp ".oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
		sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"

	else

		echo -e "    \e[1;31m[!] Oh-my-zsh isn't instaled. Installing it...\e[0m"
		#The following code is from https://github.com/Cabbagec/termux-ohmyzsh/blob/master/install.sh:
		git clone https://github.com/robbyrussell/oh-my-zsh -q
		mv oh-my-zsh/ .oh-my-zsh/
		if [ -f "$HOME/.zshrc" ]
		then

			mv "$HOME/.zshrc" "$HOME/.zshrc.$(date).bak"

		fi
		if [ -d "$HOME/.oh-my-zsh" ]
                then

                        mv "$HOME/.oh-my-zsh" "$HOME/.oh-my-zsh.$(date).bak"

                fi
		cp -r ".oh-my-zsh" "$HOME/.oh-my-zsh"
		cp ".oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
		sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"

		sleep 1

		if [ -d "$omz" ]
		then

			echo -e "    \e[1;32m[+] Oh-my-zsh instaled.\e[0m\n"

		else

			echo -e "    \e[1;31m[!] Oh-my-zsh can't be instaled. Exiting...\e[0m"
			sleep 3
			clear
			exit

		fi

	fi

	sleep 1

	#Checking if zsh-syntax-highlighting is instaled:
	zshi=.zsh-syntax-highlighting/
	if [ -d "$zshi" ]
	then

		echo -e "    \e[1;32m[+] Zsh-syntax-highlighting is instaled.\e[0m\n"
		if [ -d "$HOME/.zsh-syntax-highlighting" ]
		then

                        mv "$HOME/.zsh-syntax-highlighting" "$HOME/.zsh-syntax-highlighting.$(date).bak"

		fi
		cp -r ".zsh-syntax-highlighting" "$HOME/.zsh-syntax-highlighting"
		echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

	else

		echo -e "    \e[1;31m[!] Zsh-syntax-highlighting isn't instaled. Installing it...\e[0m"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting -q
		mv zsh-syntax-highlighting/ .zsh-syntax-highlighting/
		if [ -d "$HOME/.zsh-syntax-highlighting" ]
                then

                        mv "$HOME/.zsh-syntax-highlighting" "$HOME/.zsh-syntax-highlighting.$(date).bak"

                fi
		cp -r .zsh-syntax-highlighting/ "$HOME/.zsh-syntax-highlighting/"
		echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc
		sleep 1

		if [ -d "$zshi" ]
		then

			echo -e "    \e[1;32m[+] Zsh-syntax-highlighting instaled.\e[0m\n"

		else

			echo -e "    \e[1;31m[!] Zsh-syntax-highlighting can't be instaled. Exiting...\e[0m"
			sleep 3
			clear
			exit

		fi

	fi
	
	sleep 1
	
	#Checking if zsh-autosuggestions is instaled:
	zsha=.zsh-autosuggestions/
	if [ -d "$zsha" ]
	then

		echo -e "    \e[1;32m[+] Zsh-autosuggestions is instaled.\e[0m\n"
		if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
		then

                        mv "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions.$(date).bak"

		fi
		cp -r ".zsh-autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
		sed -i 's/git/zsh-autosuggestions/' $HOME/.zshrc
		echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'" >> $HOME/.zshrc

	else

		echo -e "    \e[1;31m[!] Zsh-autosuggestions isn't instaled. Installing it...\e[0m"
		git clone https://github.com/zsh-users/zsh-autosuggestions -q
		mv zsh-autosuggestions/ .zsh-autosuggestions/
		if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
                then

                        mv "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions.$(date).bak"

                fi
		cp -r ".zsh-autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
		sed -i 's/git/zsh-autosuggestions/' $HOME/.zshrc
		echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'" >> $HOME/.zshrc
		sleep 1

		if [ -d "$zsha" ]
		then

			echo -e "    \e[1;32m[+] Zsh-autosuggestions instaled.\e[0m\n"

		else

			echo -e "    \e[1;31m[!] Zsh-autosuggestions can't be instaled. Exiting...\e[0m"
			sleep 3
			clear
			exit

		fi

	fi

}

#Kali Dark 2020.4 scheme function:
kali.dark.2020.4()
{

	apply

	sleep 1

	#Applying changes:
	#The following code is from https://github.com/Cabbagec/termux-ohmyzsh/blob/master/.termux/colors.sh and from https://github.com/Cabbagec/termux-ohmyzsh/blob/master/.termux/fonts.sh:
	sed -i '1iZSH_THEME="kali.dark.2020.4"' "$HOME/.zshrc"
	cp -rf .ks4t-core/colors/kali.dark.2019.4.colors "$(dirname $0)/colors.properties"
	cp -rf .ks4t-core/fonts/firacode/firacode.ttf "$(dirname $0)/font.ttf"
	
	cp .ks4t-core/zsh/kali.dark.2020.4.zsh-theme "$HOME/.oh-my-zsh/themes/kali.dark.2020.4.zsh-theme"

	sleep 1

        echo -e "    \e[1;32m[+] Type your username. (If you leave it blank, it will be 'kali').\e[0m"
        read -p ">>> " nick
        if [ "$nick" != "" ]
	then

		sed -i "s/nick/$nick/" "$HOME/.oh-my-zsh/themes/kali.dark.2020.4.zsh-theme"

	else

		sed -i "s/nick/kali/" "$HOME/.oh-my-zsh/themes/kali.dark.2020.4.zsh-theme"

	fi

	sleep 1

        echo -e "\n    \e[1;32m[+] Type your host. (If you leave it blank, it will be 'kali').\e[0m"
        read -p ">>> " host
	if [ "$host" != "" ]
        then

		sed -i "s/host/$host/" "$HOME/.oh-my-zsh/themes/kali.dark.2020.4.zsh-theme"

        else

		sed -i "s/host/kali/" "$HOME/.oh-my-zsh/themes/kali.dark.2020.4.zsh-theme"

        fi

	sleep 1

        echo -e "\n    \e[1;33m[*] Applying changes. This can take some time... \e[0m\n"
	if [ -f "$HOME/../usr/etc/motd" ]
	then

		mv "$HOME/../usr/etc/motd" "$HOME/../usr/etc/motd.$(date).bak"

	fi
	chsh -s zsh
	termux-reload-settings

	sleep 1

	echo -e "    \e[1;33m[*] Changes applied. Restart your Termux to run them properly.\e[0m\n"
	sleep 5
	#Executing main menu function:
	menu

}

#Option select function:
option()
{

	read -p ">>> " schm

	case $schm in
		1|01) kali.dark.2020.4;;
		99) reset;;
		0|00) echo -e "\n    \e[1;33m[*] Exiting in 3 seconds...\e[0m"; sleep 3; clear; exit;;
		*) echo -e "\e[1;31m'$schm' is an invalid option!\e[0m"; option;;

	esac

}

#Main menu function:
menu()
{

	#Executing banner function:
	banner

	#Main menu:
	echo -e "\e[1;32m·Select one option of schemes below: \e[0m\n"
	echo -e "    \e[1;34m[01] Kali Dark 2020.4\e[0m\n"

	echo -e "    \e[1;34m[99] Reset Termux scheme\e[0m"
	echo -e "    \e[1;34m[00] Exit script\e[0m\n"

	#Executing option function:
	option

}

#Checkup function:
checkup()
{

	#Executing banner function:
	banner

	sleep 1

	#Checking if git is installed:
	if [ -x "$(command -v git)" ]
	then

		echo -e "    \e[1;32m[+] Git is instaled.\e[0m\n"

	else
		echo -e "    \e[1;31m[!] Git isn't instaled. Installing it...\e[0m"
		apt install -q git -y
		sleep 1

		if [ -x "$(command -v git)" ]
		then

			echo -e "    \e[1;32m[+] Git instaled.\e[0m\n"

		else

			echo -e "    \e[1;31m[!] Git can't be instaled. Run 'apt update -y && apt upgrade -y' before use this script.\n\n    Exiting...\e[0m"
			sleep 3
			exit

		fi

	fi

	sleep 1

	#Checking if core is installed
	cre=.ks4t-core/
	if [ -d "$cre" ]
	then

		echo -e "    \e[1;32m[+] Core is instaled.\e[0m\n"

	else

		echo -e "    \e[1;31m[!] Core isn't instaled. Installing it...\e[0m"

                git clone https://github.com/sidneypepo/kalischemes4termux -q
                mv kalischemes4termux/.ks4t-core .ks4t-core
		rm -rf kalischemes4termux/
		sleep 1

		if [ -d "$cre" ]
                then

                        echo -e "    \e[1;32m[+] Core instaled.\e[0m\n"

                else

                        echo -e "    \e[1;31m[!] Core can't be instaled. Exiting...\e[0m"
                        sleep 3
                        clear
                        exit

                fi

	fi

}

#Executing banner function:
banner
#Executing checkup function:
checkup

sleep 3

clear
#Executing banner function:
banner
#Executing main menu function:
menu
