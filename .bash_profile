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
export PS1='[\e[32m\w\e[33m$(parse_git_branch)]\e[39m $ '

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# added by Snowflake SnowCD installer
export PATH=/opt/snowflake/snowcd:$PATH

# add pyenv to path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# add bin to path
export PATH=$HOME/bin:$PATH

