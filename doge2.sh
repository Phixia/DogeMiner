#!/bin/bash

/usr/bin/git clone https://github.com/pooler/cpuminer.git

cd cpuminer/

bash autogen.sh

CFLAGS="-O3 -Wall -msse2" ./configure

/usr/bin/make

screen -S muchcoin
