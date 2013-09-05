export LC_ALL="en_US.utf-8"
export PATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="dpoggi"

# Plugins can be found in ~/.oh-my-zsh/plugins/*. Custom may be added to ~/.oh-my-zsh/custom/plugins/
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

alias elasticsearch.start='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'
alias memcached.start='/usr/local/opt/memcached/bin/memcached'

# Rails
alias z='zeus'

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


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NO_ASSETS_DEBUG=true
