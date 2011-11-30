#!/bin/bash

#install compilation prerequisites
sudo apt-get install build-essential git cmake libssl-dev libx11-dev libxext-dev libxinerama-dev libxcursor-dev libxdamage-dev libxv-dev libxkbfile-dev libasound2-dev libcups2-dev
sudo apt-get install libcunit1-dev libdirectfb-dev xmlto doxygen

#don't forget where you came from
OLD_CWD=`pwd`

#create build directory
mkdir -p $HOME/src
cd $HOME/src

#check for existence of git dir
if [-d './FreeRDP/.git']
  then
    cd FreeRDP
    git pull
  else
    git clone https://github.com/FreeRDP/FreeRDP.git
    cd FreeRDP
fi

#configure
cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_SSE2=ON .

#make
make

#install
sudo make install

#ldconfig
sudo bash -c 'echo /usr/local/lib/freerdp > /etc/ld.so.conf.d/freerdp.conf'
sudo ldconfig

#done!
echo You should now be able to run FreeRDP by using the xfreerdp command.
which xfreerdp

#go back to old directory
cd $OLD_CWD
