echo off
cls
echo "Iniciando o build"
rmdir /S /Q build
mkdir build
cd build
echo "Efetuando build do cmake"
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
