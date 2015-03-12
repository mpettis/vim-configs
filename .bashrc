#!/bin/bash

function to() {
    TAG=$1
    if [ ! -f ~/.to-tags ]; then
        touch ~/.to-tags
    fi
    DIR=`grep "^$TAG:" ~/.to-tags | cut -d : -f 2 | tail -n 1`
    eval 'cd "$DIR"'
    pwd
}
 
function refpt() {
    TAG=$1
    if [ ! -f ~/.to-tags ]; then
        touch ~/.to-tags
    fi
    if [ -z "$TAG" ]; then
        cat ~/.to-tags
    else
        grep -v "^$TAG:" ~/.to-tags > ~/.to-tags.new
        echo $TAG:`pwd` >> ~/.to-tags.new
        mv ~/.to-tags ~/.to-tags.backup
        mv ~/.to-tags.new ~/.to-tags
    fi
}
 
_to() 
{
    local cur
    COMPREPLY=( )
    cur="${COMP_WORDS[COMP_CWORD]}"
    if [ -f ~/.to-tags ]; then
        COMPREPLY=( $(cut -d : -f 1 ~/.to-tags | grep "^$cur") )
    fi
}
complete -F _to to

# ## Maven
#     ## Directions from: http://maven.apache.org/download.cgi
# export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.1
# export M2=$M2_HOME/bin
#     ## Ben Martell, to make VM 'package' build ok...
# export MAVEN_OPTS="-server -Xmx4096m -XX:MaxPermSize=1024m -XX:+AggressiveOpts -XX:+DoEscapeAnalysis"
# export PATH=$M2:$PATH
# export PATH=$JAVA_HOME/bin:$PATH
# 
# ## Jython home
# #export JYTHON_HOME=/Users/mpettis/jython2.5.3
# 
# 
# 
# ## function to make a dashed line separator on terminal at terminal width
# ## https://twitter.com/climagic/status/512254743985799168
# separator(){ printf '%*s\n' $(tput cols) '' | tr ' ' -; }
# 
# ## Drake
# export DRAKEPATH=~/bin
# 
# #THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
# [[ -s "/Users/mpettis/.gvm/bin/gvm-init.sh" ]] && source "/Users/mpettis/.gvm/bin/gvm-init.sh"
# 
# 
# ## Reset DNS
# function resetdns() {
#     sudo  killall -HUP mDNSResponder
# }
# 
# ## Julia
# #alias julia='exec '"'"/Applications/Julia-0.3.3.app/Contents/Resources/julia/bin/julia"'"
# alias julia="'"/Applications/Julia-0.3.3.app/Contents/Resources/julia/bin/julia"'"
# 
# ### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
