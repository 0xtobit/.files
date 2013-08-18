#!/usr/bin/env python3

import argparse
import os
import os.path


# Master list of dotfiles that manage.py is charged with managing.
HOME = os.environ['HOME']
global master_list
master_list = (
    ('inputrc', os.path.join(HOME, '.inputrc')),
    ('zshrc', os.path.join(HOME, '.zshrc')),
    ('bashrc', os.path.join(HOME, '.bashrc')),
    ('bashrc.tobit', os.path.join(HOME, '.bashrc.tobit')),
    ('vimrc', os.path.join(HOME, '.vimrc')),
    ('tmux.conf', os.path.join(HOME, '.tmux.conf')),
    ('XTerm', os.path.join(HOME, 'XTerm')),
    ('gitignore', os.path.join(HOME, '.gitignore')),
    ('ipython_config.py',
        os.path.join(HOME,'.config/ipython/profile_default/ipython_config.py'))
    # (name of dotfile in directory with manage.py, destination for symlink)
)


def install(args):
    """Check for symlinks, creating them if they don't exist or prompt to
    remove them and replace them if they do.
    """
    # TODO better variable name?
    # NOTE assuming manage.py is in the same directory as these dotfiles
    WD = os.path.dirname(os.path.realpath(__file__))  # working directory
    for dotfile, target in master_list:
        source = os.path.join(WD, dotfile)
        # TODO check if it's a symlink?
        if not os.path.exists(target):
            os.symlink(source, target)
        else:
            answer = input("file {} exists. replace [y/n]? ".format(target))
            while answer not in ('y', 'n'):  # check for proper input
                answer = input("invalid entry\nfile {} exists. replace "
                                   "[y/n]? ".format(target))
            if answer == 'y':  # yes
                os.remove(target)
                os.symlink(source, target)


def remove(args):
    """Remove any symbolic links that might have been created by the install
    function.
    """
    for dotfile, target in master_list:
        if os.path.islink(target):
            os.remove(target)


parser = argparse.ArgumentParser(
    description="Manage your dotfiles by keeping them all in one git "
    "repository and symbolically linking them to the version controlled copy. "
    "This script will help you create or remove those symlinks. Edit the "
    "master_list variable in the script if you want to add more dotfiles."
)

# TODO add verbose
subparsers = parser.add_subparsers(title='commands')
parser_install = subparsers.add_parser('install',
                                help='install symbolic links for all "dot '
                                'files" in the appropriate place')
# TODO add force, etc. for prompt options
parser_install.set_defaults(func=install)
parser_remove = subparsers.add_parser('remove', aliases=['rm'], help='remove '
                                      'symbolic links for "dot files"')
parser_remove.set_defaults(func=remove)


args = parser.parse_args()

# Control command line arguments by function calling
args.func(args)

