function current_branch() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo ${ref#refs/heads/}
}

function current_repository() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo $(git remote -v | cut -d':' -f 2)
}

function local_branches() {
	echo `gb --no-color | sed -e 's/[*\s ]*//'`
}

function pull_all_branches() {
	remote=${1:=origin}
	current=$(current_branch)
	for branch in $(local_branches); do
		(echo -n $branch && git checkout $branch >/dev/null 2>&1 && git pull $remote $branch >/dev/null 2>&1 && echo " ok") || echo " fails"
	done
	git checkout $current >/dev/null 2>&1
}

function tickets() {
	git branch --list | grep ticket-
}

function ticket() {
	ticket="$1"

	if [ "" = "$ticket" ]; then
		echo "Usage: $0 <name>"
		return
	fi

	ticket="ticket-$ticket"
	current=$(current_branch)
	if [ "$current" = "$ticket" ]; then
		return
	fi

	exists=`git branch --list --no-color | grep "$ticket"`
	if [ "" = "$exists" ]; then
		git checkout -b "$ticket"
	else
		git checkout "$ticket"
	fi
}

function gupm() {
	source=${1:-master}
	echo $source
	current=$(current_branch)
	changed=$(git status -s | grep -e '^.M')

	if ! [ "" = "$changed" ]; then
		git stash save
	fi

	git checkout $source \
	&& git pull origin $source \
	&& git checkout $current \
	&& git rebase $source

	if ! [ "" = "$changed" ]; then
		git stash pop
	fi
}

function up_from_master() {
	current=$(current_branch)
	changed=$(git status -s | grep -e '^.M')

	if ! [ "" = "$changed" ]; then
		git stash save
	fi

#	&& git fetch --all -p -v \
	git checkout master \
	&& git pull origin master \
	&& git checkout $current \
	&& git rebase master

	if ! [ "" = "$changed" ]; then
		git stash pop
	fi
}

function git-local-branch() {
	name="local-$1"

	exists=`git branch --list --no-color | grep "$name"`
	if [ "" = "$exists" ]; then
		git checkout -b "$name"
	else
		git checkout "$name"
	fi
}

function feature() {
	name="feature-$1"
	git checkout "$name"
}

function git-up-local() {
	current=$(current_branch)
	source=`echo $current | sed -e 's/^local\-//' -`
	if [ "$current" = "$source" ]; then
		return
	fi
	exists=`git branch -a --list --no-color | egrep "^\s+$source$"`
	if [ "" = "$exists" ]; then
		return
	fi

	gupm "$source"
}

function git-push-local() {
	current=$(current_branch)
	source=`echo $current | sed -e 's/^local\-//' -`

	git-up-local

	git checkout $source \
	&& git merge $current \
	&& git push origin $source


	git checkout "$current"
}

function git-update-submodules() {
	git submodule foreach 'ref=$(git symbolic-ref HEAD 2>/dev/null); ref=${ref#refs/heads/}; git pull origin $ref' \
	&& git pull origin $(current_branch)
}

alias gg="git gui &"
alias gs='git status -sb'

alias ga='git add'
alias gc='git commit -S -m'
alias gu='git pull'
alias gp='git push'
alias gb='git branch'
alias gd='git diff'

alias gsf="git submodule foreach"
alias gsfupc="git-update-submodules"

alias gf='git fetch'
alias gfa='git fetch --all -p -v'

alias ger='git merge --no-ff'
alias gco='git checkout'
alias gup='gu origin'
alias gpu='gp origin'
alias gupa='pull_all_branches'
alias gupc='gu origin $(current_branch)'
alias gipc='gu int $(current_branch)'
alias gpuc='gp origin $(current_branch)'
alias gpic='gp int $(current_branch)'
alias gpp='git pull && git push'
alias gpm='git push origin master'
alias ggc="git gui citool &"
alias gta="gitk --all &"
alias gmt='git mergetool --tool=meld -y'
alias glast='git log --stat -n 1 --show-signature'
alias lol="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias tct=ticket

alias grm=up_from_master
alias gbak="git stash save"
alias gres="git stash pop"

alias dev='gco local-dev'
alias master='gco master'
alias prodd='gco prod'
alias prod='gco production'


alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias dot=gitdots

alias glb=git-local-branch
alias gul=git-up-local
alias gpl=git-push-local