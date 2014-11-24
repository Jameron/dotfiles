# .bashrc file, Cameron Macfarlane

# Add git branchname completion
source ~/git-completion.bash

# Show active branch in bash
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(parse_git_branch) $ "

# Alias tailf as watch
alias watch='tailf'

# Alias git as g
alias g='git'
