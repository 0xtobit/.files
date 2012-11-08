# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="vim"
export PAGER="less"
export LESS="-MqR"
export CDPATH=".:..:~"

if [ -f "$HOME/.bashrc.$USER" ]; then
  source $HOME/.bashrc.$USER
fi
