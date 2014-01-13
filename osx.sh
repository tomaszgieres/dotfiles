# curl -L https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm
rvm install 1.9.3
rvm install 2.0.0

brew install mysql

brew install postgres
initdb /usr/local/var/postgres -E utf8    # create a database
