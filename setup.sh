#!/bin/bash

# Update the aptitude package manager
sudo apt-get update

# Install dependencies
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# install rbenv
cd $HOME
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
. ~/.bash_profile

# install latest Ruby (May 2016)
rbenv install -v 2.3.1
rbenv global 2.3.1

ruby -v

echo "gem: --no-document" > ~/.gemrc

# use same version as Heroku
gem install bundler -v 1.11.2

gem install rails

rbenv rehash

rails -v


