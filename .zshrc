# Path to your oh-my-zsh configuration.
ZSH=$HOME/.config/zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="awesomepanda"
#ZSH_THEME="clean"
ZSH_THEME="visor-clean"
#ZSH_THEME=""

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(visor extract svn symfony2 yum composer systemd colored-man catimg fabric gitignore jsontools systemadmin copydir copyfile cp encode64 frontend-search zsh_reload)

source $ZSH/oh-my-zsh.sh

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
MAILCHECK=0

# autoload -U colors
colors

if [ $TERM = "screen" ]; then
	export TERM=xterm-color
fi

export TERM=xterm-256color
if [ -n "$TMUX" ]; then
	export TERM=rxvt
	export COLORTERM=xterm-256color
#	export COLORTERM=xterm-256color
fi

alias zreload=". ~/.zshrc"