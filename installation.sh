#!/bin/bash

if [ "$(uname)" == "Darwin" ]
then

brew update
brew install supercollider
mkdir bin
cd bin/
git clone --recursive https://github.com/supercollider/supercollider.git
cd supercollider

brew install cmake
brew install readline
brew install qt

mkdir build
cd build

# This due to the broken Symlink feature ( https://github.com/supercollider/supercollider/issues/1119 ) 
cmake -DREADLINE_INCLUDE_DIR=/usr/local/Cellar/readline/6.3.3/include -DREADLINE_LIBRARY=/usr/local/Cellar/readline/6.3.3/lib/libreadline.dylib -DCMAKE_BUILD_TYPE=Release -DNATIVE=ON -DSC_SYMLINK_CLASSLIB=OFF .. 

make -j 8 
make install 

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then

sudo apt-get install supercollider

elif [ -n "$COMSPEC" -a -x "$COMSPEC" ]
then 
  echo $0: this script does not support Windows \:\(
fi
