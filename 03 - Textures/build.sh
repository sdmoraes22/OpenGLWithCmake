#!/bin/bash

rm -rf build
mkdir build
cd build
echo "Efetuando build do cmake"
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
echo "Linkando"
make
