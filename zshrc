# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _correct _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Correcting %e errors'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 0
zstyle :compinstall filename '/home/tobit/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

## Prompt commands
export PS1="\u@\h:\w \$ "

## For transparency
[ -n "$XTERM_VERSION" ] && transset-df -a 0.90 >/dev/null

## PATHs
export PATH=$HOME/local/bin:$PATH
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin

## Aliases for director traversal and listing
alias .='echo $PWD'
alias ..='cd ..'
alias cwd='echo $PWD'
alias home='cd ~; clear'
alias ls='/bin/ls --color -FCh'
alias la='/bin/ls --color -aCh'
alias ll='/bin/ls --color -lah'

## Safety Aliases
alias cp='cp -i -p'
alias mv='mv -i'
alias rm='rm -i'

## Sudo aliases
alias pacman="sudo pacman"
alias mount="sudo mount"
alias umount="sudo umount"
alias battery="acpi -b"

## Typo aliases
alias cd..='cd ..'

## Program shorcuts
alias uncommitted='uncommitted -w $HOME'
alias keybacklight='asus-kbd-backlight'
alias backlight='asus-screen-brightness'
alias git\?='git status -s'
alias tmux\?='tmux list-sessions'
alias tmux\!='tmux attach -t'
alias tintin='tintin -e "#session fl play.theforsakenlands.com 1848"'

## Awesome vim terminal commands
alias \:q='exit'
alias \:e='vim'
alias \:Q='exit'  # common typo
alias \:E='vim'  # common typo

alias importwin="xprop | grep WM_NAME\(STRING\) | grep -oP '\".*\"' | xargs -I window_id import -window window_id"
alias importgif="xprop | grep WM_NAME\(STRING\) | grep -oP '\".*\"' | xargs -I window_id import -adjoin -window window_id"

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
