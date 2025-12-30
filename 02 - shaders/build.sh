#!/bin/bash

rm -rf build
mkdir build
cd build
echo "Efetuando build do cmake"
cmake ..
echo "Linkando"
make
