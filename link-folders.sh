#!/bin/bash
# Script pro nalinkovani potrebnych slozek a souboru - prvni spusteni je nutne provest jako root.
# Dale lze poustet pod jednotlivymi uzivatli, kteri maji sudo opravneni - kdo nema, ma smulu

#_LOG
#_LOGERROR
# zpracovani_parametru
# user_group_setup
# instalace_acl_pro_setfacl
# update_dotfiles_git
# nalinkovani_slozek_a_souboru
# instalace_pluginu
# kompilace_ycm_parameter
#_cron_pull

configDir=/usr/local/etc/dotfiles
logFile="$configDir/linking.log"
configGroup="dotfiles"
exitValue=1

: > "$logFile"

#_LOG
# pouziti: Log() "message"
Log(){
	#provede zapis predaneho parametru do logu (/var/log/shaperd/shaperd.log)
	echo "$(date '+%b %d %T') $HOSTNAME $scriptName:(Info)[$$]: $1" >> "$logFile"
	echo -e "\e[1;92m $(date '+%b %d %T') $HOSTNAME $scriptName:(Info)[$$]: $1 \e[0m"
} 

#_LOGERROR
LogError(){
	#provede ERROR zapis predaneho parametru do logu s nazvnem scriptu v (/var/log/scripty)
	echo "$(date '+%b %d %T') $HOSTNAME $scriptName:(Error)[$$]: $1" >> "$logFile"
	echo  -e "\e[1;91m $(date '+%b %d %T') $HOSTNAME $scriptName:(Error)[$$]: $1 \e[0m"
} 

# zpracovani_parametru
if [ "$1" = "-h" -o "$1" = "--help" ]
then
	echo -e "script pro nalinkovani potrebnych slozek a souboru
- prvni spusteni je nutne provest jako root
- dale lze poustet pod jednotlivymi uzivatli, kteri maji sudo opravneni - kdo nema, ma smulu
parametry:
-h | --help\t\t\tvypis napovedy
-y | -Y\t\t\t\tparametr pro kompilaci YouCompleteMe
-x\t\t\t\t\tdebug vystup scriptu"
	exit 0
# parametr -x pro debug vystup scriptu
elif [ "$1" = "-x" ]
then
	LogError "Predan parametr -x pro debug vystup scriptu"
	set -x
fi

# user_group_setup
# vytvori skupinu a prida aktualniho uzivatele do skupiny - uzivatel musi mit sudo opravneni
# diky clenstvi ve skupine ma uzivatel pristup ke vsem konfiguracnim souborum
sudo addgroup "$configGroup"
sudo adduser "$USER" "$configGroup"

Log "Overen, doplnen uzivatel do skupiny pro dotfiles"

# instalace_acl_pro_setfacl
if ! sudo apt -y install acl
then
	LogError "Nepodarilo se nainstalovat"
	exit "$exitValue"
fi

Log "Uspesna instalace / overeni acl"

# navyseni hodnoty navratoveho kodu
((exitValue++))

# update_dotfiles_git
# provede se aktualizace repozitare, nastavi se prislusna skupina a opravneni
# setfacl upravi prava na slozkach, aby se spravne tvorily
if ! (cd "$configDir" &&\
			sudo git pull &&\
			sudo git submodule update --init --recursive || exit 1
			sudo chgrp -R "$configGroup" "$configDir" &&\
			sudo find "$configDir" -type d -exec sudo chmod g+rwxs,o-w {} \; &&
			sudo find "$configDir" -type f -exec sudo chmod g+rw {} \; &&\
			sudo setfacl -dRm u::rwX,g::rwX,o::r-X "$configDir" &&\
			sudo setfacl -Rm u::rwX,g::rwX,o::r-X "$configDir" &&\
			sudo chmod o+rx "$configDir"/link-folders.sh)
then
	LogError "Nepodarilo se aktualizovat repozitar dotfiles"
	exit "$exitValue"
fi

Log "Uspesne aktualizovan repozitar a nastavena opravneni"

# navyseni hodnoty navratoveho kodu
((exitValue++))

# nalinkovani_slozek_a_souboru
# pokud existuje slozka /home/vaclavz, tak z ni nalinkuje vse potrebne definovane
if [ -d "$configDir" ]
then
	rm ~/.screenrc; ln -sv "$configDir"/.screenrc ~/ || echo "nepodarilo se nalinkovat .screenrc"
	rm -r ~/.tmux; ln -sv "$configDir"/.tmux ~/ || echo "nepodarilo se nalinkovat .tmux"
	rm ~/.tmux.conf; ln -sv "$configDir"/.tmux.conf ~/ || echo "nepodarilo se nalinkovat .tmux.conf"
	rm -r ~/.vim; ln -sv "$configDir"/.vim ~/ || echo "nepodarilo se nalinkovat .vim"
	rm ~/.vimrc; ln -sv "$configDir"/.vimrc ~/ || echo "nepodarilo se nalinkovat .vimrc"
	rm -r ~/.zsh; ln -sv "$configDir"/.zsh ~/ || echo "nepodarilo se nalinkovat .zsh"
	rm ~/.zshrc; ln -sv "$configDir"/.zshrc ~/ || echo "nepodarilo se nalinkovat .zshrc"
	rm ~/.zshenv; ln -sv "$configDir"/.zshenv ~/ || echo "nepodarilo se nalinkovat .zshenv"
	rm ~/.gdbinit; ln -sv "$configDir"/.gdbinit ~/ || echo "nepodarilo se nalinkovat .gdbinit"
	touch ~/.pgpass && chmod 600 ~/.pgpass
else
	LogError "Nebyla nalezena slozka $configDir - je spravne naklonovany repozitar dotfiles?"
	exit "$exitValue"
fi

# navyseni hodnoty navratoveho kodu
((exitValue++))

# instalace_pluginu
vim +PluginInstall +PluginClean +qall

if ! sudo chsh -s /bin/zsh "$USER"
then
	Log "Problem pri zmene vychoziho shellu na zsh"
	exit "$exitValue"
fi

# navyseni hodnoty navratoveho kodu
((exitValue++))

# kompilace_ycm_parameter
if [ "$1" = "-y" -o "$1" = "-Y" ]
then
	Log "Predan parametr pro zpracovani a kompilaci YouCompleteMe"

	# cd do slozky ycm
	if ! (cd ~/.vim/bundle/YouCompleteMe &&\
				sudo ./install.py --clang-completer)
	then
		LogError "Problem pri kompilaci YouCompleteMe"
		exit "$exitValue"
	fi
fi

# navyseni hodnoty navratoveho kodu
((exitValue++))

#_cron_pull
#pokud neni zaznam pro automaticky pull repozitare - pouze pod rootem
if [ ! -e /etc/cron.d/dotfiles -a "$UID" -eq 0 ]
then
	#vytvori radek, ktery spousti dany script ve 2:00
	{ 
		echo "# denni aktualizace dotfiles repozitare"
		echo "0 2 * * * root cd $configDir && /usr/bin/git pull > /usr/local/etc/dotfiles/pull-result.log"
	} > /etc/cron.d/dotfiles
	Log "zapsano automaticke aktualizovani do cronu"
elif [ "$UID" -ne 0 ]
then
	Log "vynechana kontrola cronu - script nebezi pod rootem"
fi

exit 0
