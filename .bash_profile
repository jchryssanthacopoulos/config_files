# set up long listing
alias ll='ls -l'

# set up git aliases
alias gs='git status'
alias gr='git remote -v'
alias gb='git branch'
alias gl='git log'
alias gap='git add -p'
alias gca='git commit --amend'
alias gpn='git pull --rebase nestio master'  # rebase off of remote nestio master

# set up docker aliases
alias dcr='docker-compose run --rm'
alias dclear='docker system prune -a'

# set up kubernetes configuration
export KUBECONFIG="${HOME}/.kube/config-nestio-production-b:$KUBECONFIG"

# set up conda activate alias
conda_activate() {
  conda activate env
  export PS1='\e[34m($(python --version 2>&1)) \e[39m'$PS1
}
alias ca='conda_activate'

# add pyenv to path
export PATH="/Users/jamesc/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
  # if not found in /usr/local/etc, try the brew --prefix location
  [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
    . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# add git branch to prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GIT_PS1_SHOWDIRTYSTATE=true  # add + when there are changes
export PS1='[\u@\h \e[32m\w\e[33m$(parse_git_branch)]\e[39m $ '

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# added by Snowflake SnowCD installer
export PATH=/opt/snowflake/snowcd:$PATH
