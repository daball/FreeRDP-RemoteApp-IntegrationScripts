#!/bin/bash

if [ -d $HOME/bin ]
  then
    echo $HOME/bin detected.
  else
    echo Be sure to log out and log back in to your window manager to be sure that the $HOME/bin folder gets sourced.
fi

#install runtime prerequisites
sudo apt-get install python2.7

#install gnome menu editor
sudo apt-get install alacarte

#don't forget where you came from
OLD_CWD=`pwd`

#create runtime directory
mkdir -p $HOME/bin

#install binaries
cp src/remoteapp $HOME/bin/
cp src/convert_local_to_remoteapp $HOME/bin

#done!
echo Copied remoteapp to $HOME/bin.
