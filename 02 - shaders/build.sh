#!/bin/bash

echo "Removendo pasta de build"
rm -rf build
echo "Criando pasta de build"
mkdir build
echo "Navegando para a pasta de build"
cd build
echo "Efetuando build do cmake"
cmake ..
echo "Linkando"
make
