#!/usr/bin/env bash

usage() {
  echo Usage: $0 options
  echo
  echo "  -g      Install global (/etc/bash.bashrc)"
  echo "  -t dir  Target directory"
}

TARGETDIR=`pwd`/.dotfiles

while [[ $# > 0 ]] ; do
  key="$1"

  case $key in
      -g|--global)
        GLOBALINSTALL=true
      ;;
      -h|--help)
        usage
        exit 0
      ;;
      -t|--target)
        TARGETDIR="$2"
        shift
      ;;
      *)
      # unknown option
      ;;
  esac
  shift
done

mkdir -p $TARGETDIR
cd $TARGETDIR
TARGETDIR=`pwd` # use absolute path from here
echo Installing to $TARGETDIR

echo Downloading ...
curl -sSL https://github.com/psi-4ward/dotfiles/archive/master.tar.gz | tar xz --strip 1

function installBashrc {
  local BASHRC_FILE=$TARGETDIR/bash/bashrc
  if grep -qi $BASHRC_FILE $1 ; then
    echo $1 already sources $BASHRC_FILE
    return
  fi
  echo "Adding \"source $BASHRC_FILE\" to $1"
  echo "source $BASHRC_FILE" >> $1
}

function installInputrc {
  [ -h $1 ] && rm $1
  [ -e $1 ] && mv $1 $1.`date +"%Y-%m-%d"`.bak
  echo Symlinking $1
  ln -s $TARGETDIR/bash/inputrc $1
}

function installVimrc {
  [ -h $1 ] && rm $1
  [ -e $1 ] && mv $1 $1.`date +"%Y-%m-%d"`.bak
  echo Symlinking $1
  ln -s $TARGETDIR/vim/vimrc $1
}

if [ "$GLOBALINSTALL" == "1" ]; then
  if [ $(whoami) != "root" ]; then
    echo "I'm not root"
    echo "Please run $0 $@"
    exit1
  fi
  installBashrc /etc/bash.bashrc
  installInputrc /etc/inputrc
  installVimrc /etc/vimrc
else
  installBashrc $HOME/.bashrc
  installInputrc $HOME/.inputrc
  installVimrc $HOME/.vimrc
fi