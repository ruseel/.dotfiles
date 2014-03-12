# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias ls='ls -hF --color=tty'                 # classify files in colour

alias ...='cd ../..'

alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gco='git checkout'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias ga='git add -p'
alias gl='git log'
alias glp='git log -p'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'

alias erc='vi + ~/.bashrc && source ~/.bashrc'
alias spi='cd ~/p/spike && vi'

alias grun='java org.antlr.v4.runtime.misc.TestRig'

export EDITOR=vi
export SOCKS5_USER=munshik
export SOCKS5_PASSWD=munshik

export JRUBY_OPTS='-J-Dfile.encoding=utf8'

export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M"
#export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:8888,server=y,suspend=y"

alias clj='java -Dfile.encoding=utf-8 -cp "$CLOJURE_LIB" clojure.main'
alias m='ssh da-master'

if [ -f .bash_local ]; then
  . .bash_local
fi
