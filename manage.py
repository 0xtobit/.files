#!/usr/bin/env python3

import argparse
import os
import os.path


# Master list of dotfiles that manage.py is charged with managing.
HOME = os.environ['HOME']
master_list = [
    ('inputrc', os.path.join(HOME, '.inputrc')),
    ('zshrc', os.path.join(HOME, '.zshrc')),
    ('bashrc', os.path.join(HOME, '.bashrc')),
    ('bashrc.tobit', os.path.join(HOME, '.bashrc.tobit')),
    ('vimrc', os.path.join(HOME), '.vimrc'),
    ('tmux.conf', os.path.join(HOME), '.tmux.conf'),
    ('XTerm', os.path.join(HOME, 'XTerm')),
    ('gitignore', os.path.join(HOME, '.gitignore')),
    ('ipython_config.py',
        os.path.join(HOME,'.config/ipython/profile_default/ipython_config.py'))
    # (name of dotfile in directory with manage.py, destination for symlink)
]


parser = argparse.ArgumentParser(
    "Manage your dotfiles by keeping them all in one git repository and "
    "symbolically linking them to the version controlled copy. This script "
    "will help you create or remove those symlinks. Edit the master_list "
    "variable in the script if you want to add more dotfiles."
)

parser.add_argument('install', action='store_true',
                    help='install symbolic links for all "dot files" in the '
                    'appropriate place')

parser.add_argument('remove', action='store_true',
                    help='remove symbolic links for "dot files"')
# TODO add arguments to adjust the y/n prompt to remove files if they already
# exist

args = parser.parse_args()


WD = os.path.dirname(os.path.realpath(__file__))  # working directory
# TODO better variable name?
# NOTE assuming manage.py is in the same directory as these dotfiles

# Check for symlinks, creating them if they don't exist or prompting to remove
# them and replace them if they do.
if args.install:
    for dotfile, target in master_list:
        source = os.path.join(WD, dotfile)
        # TODO check if it's a symlink?
        if not os.path.exists(target):
            os.symlink(source, target)
        else:
            answer = raw_input("file {} exists. remove [y/n]? ".format(target))
            while answer not in ('y', 'n'):  # check for proper input
                answer = raw_input("invalid entry\nfile {} exists. remove "
                                   "[y/n]? ".format(target))
            if answer == 'y':  # yes
                os.remove(target)
                os.symlink(source, target)
elif args.rm:
    raise NotImplementedError
