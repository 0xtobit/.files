# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _correct
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'correcting %e errors'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 0

autoload -Uz compinit
compinit
# End of lines added by compinstall
##############################################################################
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

## Environment Variables
export EDITOR="vim"
export PAGER="less"
export LESS="MqR"
export CDPATH=".:..:~"

# For virtualcandy
# source ~/code/virtualcandy/src/virtualcandy.zsh
source ~/.secret_sauce

###############################################################################
#                                   Aliases
###############################################################################
## Aliases for director traversal and listing
alias .='echo $PWD'
alias ..='cd ..'
alias cwd='echo $PWD'
alias home='cd ~; clear'
alias ls='/bin/ls -FChG'
alias la='/bin/ls -aChG'
alias ll='/bin/ls -lahG'

## Sudo aliases
alias pacman="sudo pacman"
alias mount="sudo mount"
alias umount="sudo umount"
alias battery="acpi -b"

## Typo aliases
alias cd..='cd ..'

## Rails aliases
alias be="bundle exec"

## Program shorcuts
alias uncommitted='uncommitted -w $HOME'
alias keybacklight='asus-kbd-backlight'
alias backlight='asus-screen-brightness'
alias git\?='git status -s'
alias 'gitbranch'='git branch | cat'
alias 'gitb'='git branch | cat'
alias cleanbranches='git branch --merged | grep -v \"\*\" | grep -v master | grep -v dev | xargs -n 1 git branch -d'
alias tmux\?='tmux list-sessions'
alias tmux\!='tmux attach -t'
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"

## Awesome vim terminal commands
alias \:q='exit'
alias \:e='vim'
alias \:Q='exit'  # common typo
alias \:E='vim'  # common typo

## Load zmv which is awesome.
# Example: mmv *.cc *.cpp to rename all .cc files to .cpp
autoload -U zmv
alias mmv='noglob zmv -W'
alias mcp='noglob zmv -WC'

# zargs is like xargs but you can use globbing
autoload zargs

alias importwin="xprop | grep WM_NAME\(UTF8_STRING\) | grep -oP '\".*\"' | xargs -I window_id import -window window_id"
alias importgif="xprop | grep WM_NAME\(STRING\) | grep -oP '\".*\"' | xargs -I window_id import -adjoin -window window_id"

## History search partial completion
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

## Use Ctrl-LeftArrow/RightArrow to move backward/forward on word boundaries
bindkey "\e[1;5D" backword-word
bindkey "\e[1;5C" backword-word

bindkey -v

## Modify vi style bindings to be more like Vim
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo
bindkey -M vicmd 'Y' vi-yank-eol

###############################################################################
#                                Zshell options
###############################################################################
autoload -U colors && colors

# source /usr/share/doc/pkgfile/command-not-found.zsh

setopt HIST_IGNORE_DUPS

##############################################################################
#                                  Oh-My-Zsh
##############################################################################
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#ZSH_THEME="gianu"
#ZSH_THEME="fox"
#ZSH_THEME="sporty_256"
#ZSH_THEME="wezm"
#ZSH_THEME="wezm+"
ZSH_THEME="refined"

plugins=(git)

source $ZSH/oh-my-zsh.sh

##############################################################################

##############################################################################
#                                  Pure
##############################################################################
autoload -Uz promptinit
promptinit

##############################################################################

##############################################################################
## For transparency
[ -n "$XTERM_VERSION" ] && transset-df -a 0.90 >/dev/null

setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -v

## Safety Aliases
alias cp='cp -i -p'
alias mv='mv -i'
alias rm='rm -i -v'

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#eval "$(rbenv init -)"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin" # Add Postgres commands
export NVM_DIR="$HOME/.nvm"
TERMINAL_FLAVOR='$HOME/local/bin/fortune.py'
#FILE=/etc/resolv.conf
if test -f "$TERMINAL_FLAVOR"; then
    echo "$TERMINAL_FLAVOR exists."
fi
