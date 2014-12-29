# .bashrc file, Cameron Macfarlane
source ~/git-completion.bash
alias log='tailf app/storage/logs/laravel.log'
alias g='git'

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {

	# colors=( "\[\033[0;31m\]" "\[\033[1;31m\]" "\[\033[0;32m\]" "\[\033[1;32m\]" "\[\033[0;33m\]" "\[\033[1;33m\]" "\[\033[0;34m\]" "\[\033[1;34m\]" "\[\033[0;35m\]" "\[\033[0;36m\]" "\[\033[1;36m\]" "\[\033[1;37m\]" "\[\033[0;37m\]" )
	colors=("\[\033[1;31m\]" "\[\033[1;32m\]" "\[\033[1;33m\]" "\[\033[1;34m\]" "\[\033[1;36m\]" "\[\033[1;37m\]" )
	selectedcolor=${colors[$RANDOM % ${#colors[@]} ]}
	local     DEFAULT="\[\033[0m\]"
	PS1="\w $selectedcolor\$(parse_git_branch) $DEFAULT\$ "
}

proml

# Disable default ctrl+s
stty -ixon

# PS1="\u@\h: \w $GREEN\$(parse_git_branch) $DEFAULT\$ "
