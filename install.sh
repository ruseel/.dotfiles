#!/bin/bash -ex

ln -fs ~/.dotfiles/.vimrc ~/.vimrc
ln -fs ~/.dotfiles/.bash_profile ~/.bash_profile
ln -fs ~/.dotfiles/.bashrc ~/.bashrc

git config --global color.ui true
git config --global user.email "ruseel@gmail.com"
git config --global user.name "JEONG, MunShik"

bundle config --global jobs `sysctl -n hw.ncpu`
