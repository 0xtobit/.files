#!/bin/sh

cwd=$PWD
cd $HOME
ln -s $cwd/.bashrc .bashrc
ln -s $cwd/.bashrc.tobit .bashrc.tobit
ln -s $cwd/.vimrc .vimrc
ln -s $cwd/.tmux.conf .tmux.conf
ln -s $cwd/XTerm XTerm
cd $HOME/.config/ipython/profile_default/
ln -s $cwd/ipython_config.py ipython_config.py
cd $cwd
