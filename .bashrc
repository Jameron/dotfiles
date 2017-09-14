source ~/.profile
# .bashrc file, Cameron Macfarlane
export PATH=~/.composer/vendor/bin:$PATH
source ~/git-completion.bash

# shortcut to grep search
function search {
    grep -rle "$1" $(pwd)
}

# misc shortcut commands
alias v='vi'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -la'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias myip="curl http://ipecho.net/plain; echo"

# npm shortcut commands
alias dev="npm run dev"

# composer shortcut commands
alias cu='composer update'
alias cda='composer dump-autoload'

# laravel shortcut commands
alias clc='php artisan cache:clear && php artisan config:cache'
alias remigrate='php artisan migrate:refresh --seed'
alias migrate='php artisan migrate'
alias publish='php artisan vendor:publish'

# git shortcut commands
alias g='git'
alias ac='git add . && git add -u && git commit -m "testing updates, debugging"'
alias pm='git push origin master'
alias pd='git push origin develop'
alias plm='git pull origin master'
alias phpini='sudo vi /etc/php5/apache2/php.ini'

TODAY=$(date +"%Y-%m-%d")

# Monitor tail end of a Laravel 5 style log file
alias log='tail -f storage/logs/laravel.log'
alias logd='tail -f storage/logs/laravel-$TODAY.log'
alias web='cd /var/www/'

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

alias pcb=$(parse_git_branch)
function proml {

	colors=("\[\033[1;31m\]" "\[\033[1;32m\]" "\[\033[1;33m\]" "\[\033[1;34m\]" "\[\033[1;36m\]" "\[\033[1;37m\]" )
	selectedcolor=${colors[$RANDOM % ${#colors[@]} ]}
	local     DEFAULT="\[\033[0m\]"
	PS1="\w $selectedcolor\$(parse_git_branch) $DEFAULT\$ "
}
proml

PROMPT_COMMAND='echo -ne "\033]0;$(basename ${PWD})\007"'

# Disable default ctrl+s
stty -ixon
