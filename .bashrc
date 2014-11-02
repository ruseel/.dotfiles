# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#alias ls='ls -hF --color=tty'                 # classify files in colour

alias ...='cd ../..'

alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gco='git checkout'
alias gc='git commit -v'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias ga='git add -p'
alias gl='git log'
alias glp='git log -p'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'

alias prc='RAILS_ENV="production" rails console'
alias s='bundle exec rails s'
alias pgstart='postgres -D /usr/local/var/postgres/ &'
alias v='cd ~/p/valuepotion'

alias erc='vi + ~/.bashrc && source ~/.bashrc'
alias spi='cd ~/p/spike && vi'

if [[ -n $XDG_SESSION_COOKIE ]]; then 
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias grun='java org.antlr.v4.runtime.misc.TestRig'

export EDITOR=vi
export SOCKS5_USER=munshik
export SOCKS5_PASSWD=munshik

export JRUBY_OPTS='-J-Dfile.encoding=utf8'

export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M"
#export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:8888,server=y,suspend=y"

alias clj='java -Dfile.encoding=utf-8 -cp "$CLOJURE_LIB" clojure.main'
alias m='ssh master.da.daumcorp.com'

if [ -f .bash_complete ]; then
  . .bash_complete
fi

if [ -f .bash_local ]; then
  . .bash_local
fi

