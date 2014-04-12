# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="vim"
export PAGER="less"
export LESS="MqR"

export CDPATH=".:..:~"
export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin:.

if [ -f "$HOME/.bashrc.$USER" ]; then
  source $HOME/.bashrc.$USER
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
