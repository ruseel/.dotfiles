# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

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

alias grun='java org.antlr.v4.runtime.misc.TestRig'

export EDITOR=vi
export SOCKS5_USER=munshik
export SOCKS5_PASSWD=munshik

export JRUBY_OPTS='-J-Dfile.encoding=utf8'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home/
export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M"
#export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:8888,server=y,suspend=y"

alias clj='java -Dfile.encoding=utf-8 -cp "$CLOJURE_LIB" clojure.main'
alias m='ssh master.da.daumcorp.com'

if [ -f .bash_local ]; then
  . .bash_local
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


export JAVA_HOME=/Library/Java/Home

export HADOOP_PREFIX=/Users/ruseel/Tools/hadoop-2.0.0-cdh4.6.0
export HADOOP_HOME=/Users/ruseel/Tools/hadoop-2.0.0-cdh4.6.0
export HADOOP_LOG_DIR=$HADOOP_PREFIX/logs
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
#export HADOOP_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 $HADOOP_OPTS"

export MAPRED_DIR=${MAPRED_DIR:-"share/hadoop/mapreduce1"}
export MAPRED_LIB_JARS_DIR=${MAPRED_LIB_JARS_DIR:-"share/hadoop/mapreduce1/lib"}

#export HIVE_HOME=$HOME/Tools/hive-0.10.0-cdh4.2.0

export PIG_HOME=/Users/ruseel/Tools/pig-0.11.0-cdh4.6.0/
export HIVE_HOME=/Users/ruseel/Tools/hive-0.10.0-cdh4.6.0/

export CLASSPATH=$HIVE_HOME/conf:$CLASSPATH

emr() {
  vi $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
}

export LC_COLLATE=C
