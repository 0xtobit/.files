#!/usr/bin/env python3

import argparse
import os
import os.path


# Master list of dotfiles that manage.py is charged with managing.
HOME = os.environ['HOME']
global MAIN_LIST
MAIN_LIST = (
    ('inputrc', os.path.join(HOME, '.inputrc')),
    ('zshrc', os.path.join(HOME, '.zshrc')),
    ('bashrc', os.path.join(HOME, '.bashrc')),
    ('bashrc.tobit', os.path.join(HOME, '.bashrc.tobit')),
    ('vimrc', os.path.join(HOME, '.vimrc')),
    ('tmux.conf', os.path.join(HOME, '.tmux.conf')),
    ('XTerm', os.path.join(HOME, 'XTerm')),
    ('gitignore', os.path.join(HOME, '.gitignore')),
    ('gitconfig', os.path.join(HOME, '.gitconfig'))
    #('ipython_config.py', os.path.join(HOME,'.config/ipython/profile_default/ipython_config.py'))
    # (name of dotfile in directory with manage.py, destination for symlink)
)


def install(args):
    """Check for symlinks, creating them if they don't exist or prompt to
    remove them and replace them if they do.
    """
    # NOTE assuming manage.py is in the same directory as these dotfiles
    WD = os.path.dirname(os.path.realpath(__file__))  # working directory
    for dotfile, target in MAIN_LIST:
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

def bt_install(args):
    """Modify MAIN_LIST with appropriate paths before calling install
    """
    MAIN_LIST = (
        ('inputrc', os.path.join(HOME, '.inputrc')),
        ('zshrc', os.path.join(HOME, '.zshrc.traff')),
        ('bashrc', os.path.join(HOME, '.bashrc')),
        ('bashrc.tobit', os.path.join(HOME, '.bashrc.traff')),
        ('vimrc', os.path.join(HOME, '.vimrc.traff')),
        ('tmux.conf', os.path.join(HOME, '.tmux.traff.conf')),
        ('XTerm', os.path.join(HOME, 'XTerm')),
        ('gitignore', os.path.join(HOME, '.gitignore')), # FIXME need remove in ./setup
        ('gitconfig', os.path.join(HOME, '.local.gitconfig'))
        #('ipython_config.py', os.path.join(HOME,'.config/ipython/profile_default/ipython_config.py'))
        # (name of dotfile in directory with manage.py, destination for symlink)
    )
    install(args)

def remove(args):
    """Remove any symbolic links that might have been created by the install
    function.
    """
    for dotfile, target in MAIN_LIST:
        if os.path.islink(target):
            os.remove(target)


parser = argparse.ArgumentParser(
    description="Manage your dotfiles by keeping them all in one git "
    "repository and symbolically linking them to the version controlled copy. "
    "This script will help you create or remove those symlinks. Edit the "
    "MAIN_LIST variable in the script if you want to add more dotfiles."
)

# TODO add verbose
subparsers = parser.add_subparsers(title='commands')
parser_install = subparsers.add_parser('install',
                                help='install symbolic links for all "dot '
                                'files" in the appropriate place')
bt_parser_install = subparsers.add_parser('bt-install',
                                help='install symbolic links for all "dot '
                                'files" in the appropriate place for Braintree\'s cpair')
# TODO add force, etc. for prompt options
parser_install.set_defaults(func=install)
bt_parser_install.set_defaults(func=bt_install)
parser_remove = subparsers.add_parser('remove', aliases=['rm'], help='remove '
                                      'symbolic links for "dot files"')
parser_remove.set_defaults(func=remove)


args = parser.parse_args()

# Control command line arguments by function calling
args.func(args)

