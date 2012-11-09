#!/bin/sh

cwd=$PWD
cd $HOME
ln -s $cwd/.bashrc .bashrc
ln -s $cwd/.bashrc.tobit .bashrc.tobit
ln -s $cwd/.vimrc .vimrc
ln -s $cwd/.tmux.conf .tmux.conf
ln -s $cwd/XTerm XTerm
cd $cwd
