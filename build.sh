#!/usr/bin/env bash
set -e
FLAGS="-O2 -fvisibility=hidden -fpermissive -mfpmath=sse"
clang $FLAGS -c -fPIC -I include/ -I interface/ -c src/*.c
clang++ $FLAGS -std=c++20 -c -fPIC -I include/ -I interface/ -c src/*.cpp
clang++ -fPIC -shared -Wl,--version-script=linker_script.txt -o libbinkdec.so *.o
rm *.o