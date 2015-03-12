    # Source .bashrc
. ~/.bashrc

    # Set the style of command line editing
#set -o vi
set -o emacs

    # Set editor
export EDITOR=vim


    # Set history length
HISTFILESIZE=2500


    # Add bin from home directory to path
export PATH=/usr/local/bin:$PATH:~/bin:/usr/local/sbin

    # Set for java7
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home


    # http://blog.imzaid.com/color-terminal-bash-on-the-mac-iterm-included
#enables color in the terminal bash shell export
#CLICOLOR=1

#sets up the color scheme for list export
#LSCOLORS=gxfxcxdxbxegedabagacad

    # Bash prompt customization
    # -------------------------
    #sets up the prompt color (currently a green similar to linux terminal)
#export PS1='\[\033[01;32m\]\n\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\n\$ '
#export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '

    # To get git info on prompt:
#. ~/data/git-completion.bash
. ~/.git-completion.bash
##export PS1='[\w$(__git_ps1 " (git:%s) ")] \$ '
export PS1='\[\033[01;32m\]\n\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\] $(__git_ps1 " (git:%s) ") \n\$ '
export GIT_PS1_SHOWDIRTYSTATE=1

#enables color for iTerm
#export TERM=xterm-color

#sets up proper alias commands when called
alias ls='ls -G'
alias lt='ls -lrt'
alias ll='ls -hl'
alias lll='ls -ahl'


#    # Shortcut open MacVim
#alias omm='open -a MacVim'
#
## Setting PATH for EPD_free-7.3-2
## The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
#export PATH
#
## Set go language variables
#export GOPATH=/Users/mpettis/gocode
#export PATH=$PATH:/Users/mpettis/gocode/bin
#
## Set path to add some data tools
#export PATH=$PATH:/Users/mpettis/data-science-toolbox-master
#export PATH=$PATH:/Users/mpettis/node_modules/.bin
#
## Oracle instaclient
## http://www.janhellevik.no/?p=521
#export ORACLE_HOME=/Applications/instantclient_11_2
##export OCI_LIB=/Applications/instantclient_11_2
##export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Applications/instantclient_11_2
#export DYLD_LIBRARY_PATH=/Applications/instantclient_11_2:$DYLD_LIBRARY_PATH
#export PATH=$PATH:/Applications/instantclient_11_2
#
### Perlbrew
### from: https://github.com/Homebrew/homebrew/wiki/Gems,-Eggs-and-Perl-Modules
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
### 
#source ~/perl5/perlbrew/etc/bashrc
#
#
### Hadoop
#export HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc= -Djava.awt.headless=true"
#
### Hive
#export HIVE_HOME=/usr/local/Cellar/hive/0.11.0/libexec
#
### From Phil
### https://confluence.quantumretail.com/display/~mieslep/Changing+Java+versions+and+JDK+in+Mac+OSX
#export PREJAVA_PATH="$PATH:~/bin"
#export PATH="${PREJAVA_PATH}"
#. gojava -d
#
#
## Haskell: https://www.haskell.org/platform/mac.html
##file:///Library/Haskell/doc/start.html
#export PATH="$HOME/Library/Haskell/bin:$PATH"
#
##THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
#[[ -s "/Users/mpettis/.gvm/bin/gvm-init.sh" ]] && source "/Users/mpettis/.gvm/bin/gvm-init.sh"

