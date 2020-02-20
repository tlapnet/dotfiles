# SET UP THE PROMPT
bindkey -e
autoload -Uz promptinit
promptinit

# different color on systemd distributions
if which systemctl &> /dev/null
then
	# different color for root
	if [[ $UID -eq 0 ]] ; then
		#PS1=${PREFIX}$'%{\e[01;31m%}%n @ %{\e[01;36m%}%M %{\e[01;33m%}<systemctl> %{\e[01;37m%}(%*): %{\e[01;31m%}%0/
		PS1=${PREFIX}$'%{\e[01;31m%}%n @ %{\e[01;36m%}%M %{\e[01;37m%}(%*): %{\e[01;31m%}%0/
%{\e[01;31m%}%1~ %# %{\e[0m%}'
	else
		#PS1=${PREFIX}$'%{\e[01;33m%}%n @ %{\e[01;36m%}%M %{\e[01;33m%}<systemctl> %{\e[01;37m%}(%*): %{\e[01;33m%}%0/
		PS1=${PREFIX}$'%{\e[01;33m%}%n @ %{\e[01;36m%}%M %{\e[01;37m%}(%*): %{\e[01;33m%}%0/
%{\e[01;33m%}%1~ %# %{\e[0m%}'
	fi
else
	# different color for root
	if [[ $UID -eq 0 ]] ; then
		#PS1=${PREFIX}$'%{\e[01;31m%}%n @ %{\e[01;36m%}%M %{\e[01;33m%}<service> %{\e[01;37m%}(%*): %{\e[01;31m%}%0/
		PS1=${PREFIX}$'%{\e[01;31m%}%n @ %{\e[01;36m%}%M %{\e[01;37m%}(%*): %{\e[01;31m%}%0/
%{\e[01;31m%}%1~ %# %{\e[0m%}'
	else
		#PS1=${PREFIX}$'%{\e[01;33m%}%n @ %{\e[01;36m%}%M %{\e[01;33m%}<service> %{\e[01;37m%}(%*): %{\e[01;33m%}%0/
		PS1=${PREFIX}$'%{\e[01;33m%}%n @ %{\e[01;36m%}%M %{\e[01;37m%}(%*): %{\e[01;33m%}%0/
%{\e[01;33m%}%1~ %# %{\e[0m%}'
	fi
fi

# adds snap into path if exists
if [ -d "/snap/bin" ] ; then
    PATH="/snap/bin:$PATH"
fi

# OPTIONS
# zabranuje tvoreni duplicit
setopt histignoredups 
# prubezne pripisuje zaznamy do historie
setopt incappendhistory 
#
setopt extendedglob 
# umoznuje predavat * prikazum, nehlasi error
setopt nonomatch
# vypise hodnotu exit, kdyz neni 0
setopt printexitvalue
# lepsi doplnovani {} pri tabu
setopt rcexpandparam
# kontroluje maily
setopt mailwarning
# automaticke pushovani slozek do seznamu
setopt autopushd pushdignoredups pushdtohome pushdsilent
# nebude killovat bg procesy
setopt nohup

# COMPLETION SYSTEM
autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit
# tc tab completion
source ~/.zsh/tc

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/zsh_cache
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(# b) # ([0-9]# )*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# KEY BINDINGS
# backspace
bindkey "^?" backward-delete-char
# insert
bindkey "^[[2~" overwrite-mode
# home
bindkey "^[OH" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[1" beginning-of-line
bindkey "^[[1~" beginning-of-line
# page up
bindkey "^[[5~" up-line-or-search
# delete
bindkey "^[[3~" delete-char
# end
bindkey "^[OF" end-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4" end-of-line
bindkey "^[[4~" end-of-line
# page down
bindkey "^[[6~" down-line-or-search

# VARIABLES
export TZ="Europe/Prague"
export PAGER='less'
export EDITOR='vim'
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile_zsh
# znaky definujici slovo - viz https://unix.stackexchange.com/a/392199
#WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
WORDCHARS='*?_-]~&;!#$%^)}>'
# vynuceni anglictiny
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC=en_US.UTF-8
LC_TIME=en_US.UTF-8
LC_COLLATE="en_US.UTF-8"
LC_MONETARY=en_US.UTF-8
LC_MESSAGES="en_US.UTF-8"
LC_PAPER=en_US.UTF-8
LC_NAME=en_US.UTF-8
LC_ADDRESS=en_US.UTF-8
LC_TELEPHONE=en_US.UTF-8
LC_MEASUREMENT=en_US.UTF-8
LC_IDENTIFICATION=en_US.UTF-8

#FUNCTION
source ~/.zsh/functions

# ALIASES
source ~/.zsh/aliases

# local configuration overload
if [ -f ~/.zshrc.local ] ; then
	source ~/.zshrc.local
fi

