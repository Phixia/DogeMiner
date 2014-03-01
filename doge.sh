#!/bin/bash

/usr/sbin/useradd -m -s /bin/bash dogeminer

/usr/bin/apt-get update
/usr/bin/apt-get install -y build-essential autotools-dev libcurl4-gnutls-dev autoconf automake screen

/bin/mkdir -p /home/dogeminer/.ssh/ && cp dogeminer.authorized_keys /home/dogeminer/.ssh/authorized_keys

/bin/chown -R dogeminer:dogeminer /home/dogeminer && /bin/chmod 600 /home/dogeminer/.ssh/authorized_keys

/bin/chown dogeminer /dev/pts/0

/bin/su - dogeminer

cd ~/

/usr/bin/git clone https://github.com/pooler/cpuminer.git

cd cpuminer/

bash autogen.sh

CFLAGS="-O3 -Wall -msse2" ./configure

/usr/bin/make

screen -S muchcoin

