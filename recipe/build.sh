#!/bin/bash

chmod +x configure

if [[ "$target_platform" == "osx-64" ]]; then
    ./configure --prefix=$PREFIX --with-pic --enable-cxx --build=x86_64-apple-darwin
elif  [[ "$target_platform" == "linux-64" ]]; then
    ./configure --prefix=$PREFIX --with-pic --enable-cxx --enable-fat
else
    ./configure --prefix=$PREFIX --with-pic --enable-cxx --host=$HOST
fi

make -j${CPU_COUNT}
make check -j${CPU_COUNT}
make install
