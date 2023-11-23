#!/bin/sh

PACKAGES='abook bash fdm finger git mutt nethack taskwarrior tmux uncrustify vim'
PACKAGEMGR=''

# we need stow. install it if it's missing.
if [[ $(which stow) == '' ]]
then
	if [[ -f /etc/redhat-release ]]
	then
		# redhat -- use yum
		PACKAGEMGR='sudo yum install -y'
	fi

	if [[ -f /etc/debian_version ]]
	then
		# debian -- use apt
		PACKAGEMGR='sudo apt-get install -y'
	fi

	if [[ $(uname -s) == 'Darwin' ]]
	then
		# MacOS -- now check for packagemanagers
		if [[ -L /usr/local/bin/brew ]]
		then
			# found homebrew
			PACKAGEMGR='brew install'
		else
			echo "ERROR: Couldn't find a package manager"
			exit 1
		fi
	fi

	if [[ $(uname -s) == 'OpenBSD' ]]
	then
		PACKAGEMGR='doas pkg_add -v'
	fi

	${PACKAGEMGR} stow
fi

# symlink all of the dotfile packages
for package in $PACKAGES
do
	stow $package
done

