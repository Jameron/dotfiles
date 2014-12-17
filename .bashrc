# .bashrc file, Cameron Macfarlane

# Add git branchname completion
source ~/git-completion.bash

# Alias tailf as watch
alias watch='tailf'

# Alias git as g
alias g='git'

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
  	local        BLUE="\[\033[0;34m\]"
	# OPTIONAL - if you want to use any of these other colors:
  	local         RED="\[\033[0;31m\]"
  	local   LIGHT_RED="\[\033[1;31m\]"
  	local       GREEN="\[\033[0;32m\]"
  	local LIGHT_GREEN="\[\033[1;32m\]"
  	local       WHITE="\[\033[1;37m\]"
  	local  LIGHT_GRAY="\[\033[0;37m\]"
	# END OPTIONAL
	local     DEFAULT="\[\033[0m\]"
	PS1="\w $GREEN\$(parse_git_branch) $DEFAULT\$ "
}
# PS1="\u@\h: \w $GREEN\$(parse_git_branch) $DEFAULT\$ "
proml

