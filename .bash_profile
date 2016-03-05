# .bashrc file, Cameron Macfarlane
export PATH=/usr/local/Cellar/php56/5.6.15/bin:$PATH
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

source ~/git-completion.bash
alias log='tail -f storage/logs/laravel.log'
alias g='git'
alias vim='/usr/local/Cellar/vim/7.4.903/bin/vim'
alias vi='/usr/local/Cellar/vim/7.4.903/bin/vim'

alias ac='git add . && git add -u'
alias pm='git commit -m "testing updates" && git push origin master'
alias pd='git commit -m "testing updates" && git push origin develop'
alias ss='cd /Library/WebServer/Documents/showstop5'
alias mamp='cd /Applications/MAMP/htdocs/'
alias web='cd /Library/WebServer/Documents/'

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {

	colors=("\[\033[1;31m\]" "\[\033[1;32m\]" "\[\033[1;33m\]" "\[\033[1;34m\]" "\[\033[1;36m\]" "\[\033[1;37m\]" )
	selectedcolor=${colors[$RANDOM % ${#colors[@]} ]}
	local     DEFAULT="\[\033[0m\]"
	PS1="\w $selectedcolor\$(parse_git_branch) $DEFAULT\$ "
}
proml

# Disable default ctrl+s
stty -ixon
PROMPT_COMMAND='echo -ne "\033]0;$(basename ${PWD})\007"'
