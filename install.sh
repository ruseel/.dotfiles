#!/bin/bash -ex
ln -fs ~/.dotfiles/.gemrc ~/.gemrc
ln -fs ~/.dotfiles/.vimrc ~/.vimrc
ln -fs ~/.dotfiles/.bash_profile ~/.bash_profile
ln -fs ~/.dotfiles/.bashrc ~/.bashrc

git config --global color.ui true
git config --global github.user "ruseel"
git config --global push.default simple
git config --global user.email "ruseel@gamil.com"
git config --global user.name "ruseel"
git config --global web.browser open

if [ -e sysctl ]; then
  bundle config --global jobs `sysctl -n hw.ncpu`
fi
