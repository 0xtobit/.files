[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###############################################################################
#                                    Paths
###############################################################################
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=$HOME/local/bin:$PATH
export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin
