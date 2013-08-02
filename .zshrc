# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="robbyrussell"
# ZSH_THEME="mrtazz"
# ZSH_THEME="sunrise"
# ZSH_THEME="wedisagree"
# ZSH_THEME="gnzh"
# ZSH_THEME="afowler"
# ZSH_THEME="crunch"
# ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# RVM
[[ -s '/Users/powellj/.rvm/scripts/rvm' ]] && source '/Users/powellj/.rvm/scripts/rvm'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# recommended by brew doctor
export PATH='/Users/powellj/projects/subs/bin:/usr/local/bin:/Users/powellj/.rvm/gems/ruby-1.9.2-p290/bin:/Users/powellj/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/powellj/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/powellj/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/powellj/.rvm/bin'

# RVM
[[ -s '/Users/powellj/.rvm/scripts/rvm' ]] && source '/Users/powellj/.rvm/scripts/rvm'

# Vi mode on command line
set -o vi

# From Moen re: server loads

function lploads {
  for server in lp-app1 lp-db-master lp-dj; do
    __loads $server
  done
}

function tlloads {
  for server in tl-app1 tl-db-master tl-dj; do
    __loads $server
  done
}

function __loads {
  echo $1
  ssh $1 uptime
  ssh $1 iostat
}

CUCUMBER_FORMAT=progress
