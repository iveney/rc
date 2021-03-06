# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color|xterm|screen|rxvt)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto --group-directories-first -X'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -hlh'
alias la='ls -Ah'
#alias l='ls -CF'
alias ..='cd ..'
alias df='df -h'

#mount cse unix machine
alias gwcse="sshfs zgxiao@gw.cse.cuhk.edu.hk:/uac/gds/zgxiao /home/iveney/workspace/gwcse/"

# cuhk cse vpn commands
alias csekrdc="krdc rdp:/zgxiao@cse-pc -f -h"
alias csevpnon="sudo openvpn --config /etc/openvpn/CSE-SSL-VPN.conf"
alias csevpn="csevpnon && sleep 2 && csekrdc"
alias csevpnoff="sudo killall openvpn"

# list 10 top frequently used commands 
alias 10top="cat ~/.bash_history | sed -e 's/  *$//' | sort | uniq -cd | sort -nr | head"
# show sizes of subfolders and files in the current folder
alias d="du -sh *"

# set default clipboard for xclip
alias xclip="xclip -sel clip"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# useful bash script cdargs
source /usr/share/doc/cdargs/examples/cdargs-bash.sh

###################################################################
# environmental variables defition
# Added by iveney
VISUAL=vim
EDITOR=vim
export VISUAL EDITOR

# for input method
export XMODIFIERS="@im=fcitx"
#export XMODIFIERS="@im=scim"

# texslide style files path
export TEXINPUTS=:/home/iveney/.texmf-var/tex/latex/texslides:$TEXINPUTS

# set the PAGER to most, replace default `man'
#export PAGER=most

#less highlight, need source-highlight
PAGER='less -X -M'
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# less highlight for ESC sequence( for man page )
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# use bxviewer(for pdg file)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/share/bxviewer
export PATH=$PATH:/usr/local/share/bxviewer

#export VIM=/usr/local/share/vim/vim72
#export VIMRUNTIME=/usr/local/share/vim/vim72
