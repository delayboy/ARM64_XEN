#!/bin/sh

if test $# -lt 3; then
	echo "Usage: $0 <tree> <tag> <dir>"
	exit 1
fi

#TREE=$1 git://localhost:1080/qemu-xen.git
TREE=https://github.com/delayboy/qemu-upstream-4.6-testing.git
TAG=$2
DIR=$3

set -e

if test \! -d $DIR-remote; then
	rm -rf $DIR-remote $DIR-remote.tmp
	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
	$GIT clone $TREE $DIR-remote.tmp
	if test "$TAG" ; then
		cd $DIR-remote.tmp
		$GIT checkout qemu-xen-for-4-13
		cd ..
	fi
	mv $DIR-remote.tmp $DIR-remote
fi
rm -f $DIR
ln -sf $DIR-remote $DIR
