# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
# . ~/code/z/z.sh

# init rvm
# source ~/.rvm/scripts/rvm

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Get Pip to cache downloaded packages
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# Some virtualenv settings
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PROJECT_HOME=~/Sites
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PYTHONPATH=/usr/local/django_appengine/lib:$PYTHONPATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
alias pyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias webserver='python -m SimpleHTTPServer'
alias pgserver='postgres -D /usr/local/var/postgres'
alias mysqlserver='mysql.server start'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
