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

alias vim='mvim -v'
alias ctags='/usr/local/bin/ctags'
alias tmux='tmux -2 -u'

alias be='bundle exec'
alias bers='bundle exec rails s'
alias berc='bundle exec rails c'

alias bets='bundle exec thin start'
alias betsd='bundle exec thin start -d'
alias betr='bundle exec thin restart'
alias betst='bundle exec thin stop'

# Customize to your needs...
export PATH=$PATH:/Users/tomaszgieres/.rvm/gems/ruby-1.9.3-p392/bin:/Users/tomaszgieres/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/tomaszgieres/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/tomaszgieres/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin

