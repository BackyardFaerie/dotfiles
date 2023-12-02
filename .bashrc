# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Search APT Repos Alias
alias apts="apt-cache search"

# Combined mkdir cd Alias
mcd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}


# Uptime and Random Man Page Reminder on Terminal Start
uptime
echo "Remember to ran(d)man for a random man page!"

# Speedcrunch Aliases
alias calc="speedcrunch"
alias calculator="speedcrunch"

# Edit i3 Config Alias
alias i3-config="vim /home/fae/.config/i3/config"
alias i3config="vim /home/fae/.config/i3/config"
alias i3c="vim /home/fae/.config/i3/config"

# Ranger Required Envar
export RANGER_LOAD_DEFAULT_RC=false
# Ranger Alias
alias r="ranger"
# Update Upgrade Alias
alias upd="sudo apt update && sudo apt upgrade"

# Alias ll with Preferred Date Format
# Runs ls with -lh and Formats Date to d/m/y not m/d/y
# My first bash script :^D
ll ()
{	
	ls ${1:-"."} -lah --time-style="+%d/%m/%y %H:%M:%S"
}


# Random Man Page
alias randman="man $(find /usr/share/man/man1 -type f | shuf | head -1)"
alias ranman="man $(find /usr/share/man/man1 -type f | shuf | head -1)"

# Run Telegram
alias tele="/home/fae/Telegram/Telegram"
alias telegram="/home/fae/Telegram/Telegram"

# YACReader Alias to Bypass Unnecessary Capitalisation
alias yac="YACReader"
alias yacreader="YACReader"

# Run XIVLauncher
alias xiv="flatpak run dev.goats.xivlauncher"
# Go to DMenu Entry Directory $PATH
alias dmenu-add="cd /usr/bin/"
alias dma="cd /usr/bin/"

# Go to XIV Mods Directory
alias moddir="cd /home/fae/game-ssd/ffxiv-mods/"
alias modd="cd /home/fae/game-ssd/ffxiv-mods/"
alias cd-mods="cd /home/fae/game-ssd/ffxiv-mods/"

# Move All TTMP/TTMP2 Files to ffxiv-mods/
alias modmv="mv -v ~/Downloads/*.{ttmp,ttmp2} ~/game-ssd/ffxiv-mods/"

# Launch PCSX2
alias pcsx2="flatpak run net.pcsx2.PCSX2"

# Launch UT2004 via WINE
alias ut2004="wine /home/fae/game-ssd/ut2004/unreal-tournament-2004-complete/Unreal\ Tournament\ 2004/System/UT2004.exe"

# Vim Alias
alias v="vim"

# Edit .vimrc
alias vc="vim ~/.vimrc"

# Edit .bashrc
alias vbc="vim ~/.bashrc"

# Rust Cargo Set Dir
. "$HOME/.cargo/env"

# Set Vim to Default Editor
export EDITOR=vi

# Edit dotfiles Repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Reload .bashrc
alias sbc="source /home/fae/.bashrc"

# Open Vimwiki Index
alias vw="vim -c VimwikiIndex"
