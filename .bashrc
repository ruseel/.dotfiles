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
alias vi='vim'

alias erc='vi + ~/.bashrc && source ~/.bashrc'

alias spi='cd ~/p/spike && vi'

alias subl="\"/cygdrive/c/Program Files/Sublime Text 3/sublime_text.exe\""

alias antlr4='java -jar `cygpath -w $HOME/workspace/antlr-study/antlr-4.0-complete.jar`'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

export EDITOR=vi
export SOCKS5_USER=munshik
export SOCKS5_PASSWD=munshik
export CLASSPATH="`cygpath -w /home/user/workspace/antlr-study/antlr-4.0-complete.jar`;c:/Users/user/.m2/repository/com/microsoft/sqlserver/sqljdbc4/2.0/sqljdbc4-2.0.jar;$CLASSPATH"

export JRUBY_OPTS='-J-Dfile.encoding=utf8'

export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M"
#export MAVEN_OPTS="-Dfile.encoding=utf-8 -XX:MaxPermSize=512M -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:8888,server=y,suspend=y"


alias renderftl='java $JAVA_OPTS -Dlang=ENG -jar `cygpath -d /home/user/workspace/ftl-render/target/ftl-render-0.0.1-SNAPSHOT-jar-with-dependencies.jar`'
alias c='(export JAVA_OPTS=-Dtype=abrDuet; renderftl apply/abrDuet.ftl > ~/tmp/abrDuet.rendered.tmp; echo ========== abrDuet; diff ~/tmp/abrDuet.rendered.{org,tmp}); (export JAVA_OPTS=-Dtype=domDuet; renderftl apply/domDuet.ftl > ~/tmp/domDuet.rendered.tmp; echo ========= domDuet; diff ~/tmp/domDuet.rendered.{org,tmp} )'
alias r='(export JAVA_OPTS=-Dtype=abrDuet; renderftl apply/abrDuet.ftl > ~/tmp/abrDuet.rendered.org); (export JAVA_OPTS=-Dtype=domDuet; renderftl apply/domDuet.ftl > ~/tmp/domDuet.rendered.org)'

CLOJURE_LIB="C:\Documents and Settings\user\Documents\clj\test;C:\Documents and Settings\user\Documents\clj\src;C:\Documents and Settings\user\Documents\clj\dev-resources;C:\Documents and Settings\user\Documents\clj\resources;C:\Documents and Settings\user\Documents\clj\target\classes;C:\Users\user\.m2\repository\org\clojure\java.classpath\0.1.0\java.classpath-0.1.0.jar;C:\Users\user\.m2\repository\clj-stacktrace\clj-stacktrace\0.2.4\clj-stacktrace-0.2.4.jar;C:\Users\user\.m2\repository\org\mindrot\jbcrypt\0.3m\jbcrypt-0.3m.jar;C:\Users\user\.m2\repository\ns-tracker\ns-tracker\0.1.1\ns-tracker-0.1.1.jar;C:\Users\user\.m2\repository\javax\servlet\servlet-api\2.5\servlet-api-2.5.jar;C:\Users\user\.m2\repository\org\codehaus\jackson\jackson-smile\1.9.5\jackson-smile-1.9.5.jar;C:\Users\user\.m2\repository\ring\ring\1.0.2\ring-1.0.2.jar;C:\Users\user\.m2\repository\hiccup\hiccup\1.0.0-beta1\hiccup-1.0.0-beta1.jar;C:\Users\user\.m2\repository\noir\noir\1.3.0-beta3\noir-1.3.0-beta3.jar;C:\Users\user\.m2\repository\org\mortbay\jetty\jetty\6.1.25\jetty-6.1.25.jar;C:\Users\user\.m2\repository\clout\clout\1.0.1\clout-1.0.1.jar;C:\Users\user\.m2\repository\ring\ring-devel\1.0.2\ring-devel-1.0.2.jar;C:\Users\user\.m2\repository\org\clojure\core.incubator\0.1.0\core.incubator-0.1.0.jar;C:\Users\user\.m2\repository\cheshire\cheshire\3.0.0\cheshire-3.0.0.jar;C:\Users\user\.m2\repository\ring\ring-core\1.0.1\ring-core-1.0.1.jar;C:\Users\user\.m2\repository\org\clojure\tools.macro\0.1.0\tools.macro-0.1.0.jar;C:\Users\user\.m2\repository\ring\ring-jetty-adapter\1.0.2\ring-jetty-adapter-1.0.2.jar;C:\Users\user\.m2\repository\commons-io\commons-io\1.4\commons-io-1.4.jar;C:\Users\user\.m2\repository\org\mortbay\jetty\jetty-util\6.1.25\jetty-util-6.1.25.jar;C:\Users\user\.m2\repository\org\clojure\tools.nrepl\0.2.3\tools.nrepl-0.2.3.jar;C:\Users\user\.m2\repository\compojure\compojure\1.0.1\compojure-1.0.1.jar;C:\Users\user\.m2\repository\org\mortbay\jetty\servlet-api\2.5-20081211\servlet-api-2.5-20081211.jar;C:\Users\user\.m2\repository\commons-codec\commons-codec\1.4\commons-codec-1.4.jar;C:\Users\user\.m2\repository\org\clojure\clojure\1.5.1\clojure-1.5.1.jar;C:\Users\user\.m2\repository\clojure-complete\clojure-complete\0.2.3\clojure-complete-0.2.3.jar;C:\Users\user\.m2\repository\org\codehaus\jackson\jackson-core-asl\1.9.5\jackson-core-asl-1.9.5.jar;C:\Users\user\.m2\repository\org\clojure\tools.namespace\0.1.0\tools.namespace-0.1.0.jar;C:\Users\user\.m2\repository\ring\ring-servlet\1.0.2\ring-servlet-1.0.2.jar;C:\Users\user\.m2\repository\commons-fileupload\commons-fileupload\1.2.1\commons-fileupload-1.2.1.jar;C:\Users\user\.m2\repository\instaparse\instaparse\1.2.14\instaparse-1.2.14.jar"

alias clj='java -Dfile.encoding=utf-8 -cp "$CLOJURE_LIB" clojure.main'

alias beta='gsd && d9_build_to_beta'
alias live='d9_beta_to_live_restart_all.rb'

if [ -f .bash_local ]; then
  . .bash_local
fi
