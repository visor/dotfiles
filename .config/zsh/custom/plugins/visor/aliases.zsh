alias stt="$EDITOR ."

# quick dirs
alias doc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias pic="cd ~/Pictures"
alias distr="cd /data/Distrib"
alias ide="cd /data/Distrib/Dev/IDE"
alias video="cd /data/Video"
alias books="cd /data/Books"
alias prj="cd ~/Documents/Projects"
alias prg="cd /usr/programs"
alias dsrc="cd /data/src"

#selenium related
alias view-selenium="vncviewer localhost:5999 >/dev/null 2>&1 &"

# useful
alias json-decode="php -r 'var_export(json_decode(file_get_contents(\"php://stdin\")));'"
#alias vim="stty stop '' -ixoff ; vim"
#alias vimt="vim -u $HOME/.config/vim-test/.vimrc"
alias clr="sudo /usr/local/bin/trunc "
alias mkdd="mkdir `date +%Y.%m.%d`; cd `date +%Y.%m.%d`"
alias wwget="wget -Sbo ~/tmp/wget.log --content-disposition"