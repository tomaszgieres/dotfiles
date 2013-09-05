export LC_ALL="en_US.utf-8"
export PATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler gem git osx sublime tmux vagrant)

source $ZSH/oh-my-zsh.sh

export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_HEAP_SLOTS_INCREMENT=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=70000000
export RUBY_FREE_MIN=100000

source $HOME/.credentials.sh

# Vagrant
function vhaltall {
  echo "Halting all VMs"
  VBoxManage list runningvms | sed 's/"\(.*\)" .*/\1/g' | while read vmname; do echo "Halting $vmname"; VBoxManage controlvm "$vmname" poweroff; done
}

# OS X only
if [[ $(uname) == 'Darwin' ]]; then
  alias vim='mvim -v'
  alias ctags='/usr/local/bin/ctags'
fi

alias tmux='tmux -2 -u'

alias postgres.start='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias postgres.stop='pg_ctl -D /usr/local/var/postgres -l logfile stop'

# Rails
alias be='bundle exec'
alias bers='bundle exec rails s'
alias berc='bundle exec rails c'

alias bets='bundle exec thin start'
alias betsd='bundle exec thin start -d'
alias betr='bundle exec thin restart'
alias betst='bundle exec thin stop'

# Git
alias gsrem='git ls-files --deleted -z | xargs -0 git rm' # git stage removed files

# Customize to your needs...
export PATH=$PATH:$HOME/.rvm/gems/ruby-1.9.3-p392/bin:$HOME/.rvm/gems/ruby-1.9.3-p392@global/bin:$HOME/.rvm/rubies/ruby-1.9.3-p392/bin:$HOME/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin

