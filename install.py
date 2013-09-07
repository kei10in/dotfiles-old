#!/usr/bin/env python3

import os
import sys


class Environment(object):
    @property
    def repositorydir(self):
        return os.path.dirname(os.path.abspath(__file__))


class Emacs(object):
    @property
    def file_symlinks(self):
        return (('emacs.d', '~/.emacs.d'),)


class Vim(object):
    @property
    def file_symlinks(self):
        return (('vim', '~/.vim'),)


class Zsh(object):
    @property
    def file_symlinks(self):
        return (('zshenv', '~/.zshenv'), ('zshrc', '~/.zshrc'), ('zsh', '~/.zsh'))


class Sbt(object):
    @property
    def file_symlinks(self):
        return (('sbt', '~/.sbt'),)


class InstallCommandGenerator(object):
    def __init__(self, env, app):
        self._env = env
        self._app = app

    def __iter__(self):
        for command in self._symlink_commands():
            yield command
    
    def _symlink_commands(self):
        for src, dst in self._app.file_symlinks:
            yield self._create_symlink_command(src, dst, os.path.isdir(src))

    def _create_symlink_command(self, src, dst, target_is_directory=False):
        source = os.path.join(self._env.repositorydir, src)
        destination = dst
        return SymlinkCommand(source, destination, target_is_directory)


class CommandError(Exception):
    def __init__(self, msg, real_exception=None):
        self.real_exception = real_exception
        
    def __str__(self):
        return str(self.real_exception)


class SymlinkCommand(object):
    def __init__(self, src, dst, target_is_directory=False):
        self.src = src
        self.dst = dst
        self.target_is_directory = target_is_directory

    def execute(self):
        def symlink(src, dst, target_is_directory=False):
            if sys.platform == 'win32':
                os.symlink(src, dst, target_is_directory)
            else:
                os.symlink(src, dst)

        msg = 'Create symbolic link from {} to {}'
        print(msg.format(self.src, self.dst), file=sys.stderr)

        try:
            source = os.path.expanduser(self.src.replace('/', os.path.sep))
            destination = os.path.expanduser(self.dst.replace('/', os.path.sep))
            symlink(source, destination, self.target_is_directory)
        except OSError as e:
            print('{}: {}'.format(self.dst, e.strerror), file=sys.stderr)
        

def main():
    env = Environment()
    applications = [Emacs(), Vim(), Zsh(), Sbt()]
    for app in applications:
        for command in InstallCommandGenerator(env, app):
            command.execute()
        

if __name__ == '__main__':
    main()
