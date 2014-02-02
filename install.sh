#!/bin/bash -ex

ln -fs ~/.dotfiles/.gemrc ~/.gemrc
ln -fs ~/.dotfiles/.profile ~/.profile
ln -fs ~/.dotfiles/.vimrc ~/.vimrc

git config --global color.ui true
git config --global github.user "ruseel"
git config --global push.default simple
git config --global user.email "ruseel@gamil.com"
git config --global user.name "ruseel"
git config --global web.browser open

bundle config --global jobs `sysctl -n hw.ncpu`
