#!/bin/bash

/usr/sbin/useradd -m -s /bin/bash dogeminer

/usr/bin/apt-get update
/usr/bin/apt-get install -y build-essential autotools-dev libcurl4-gnutls-dev autoconf automake screen

/bin/mkdir -p /home/dogeminer/.ssh/ && cp dogeminer.authorized_keys /home/dogeminer/.ssh/authorized_keys

/bin/chown -R dogeminer:dogeminer /home/dogeminer && /bin/chmod 600 /home/dogeminer/.ssh/authorized_keys

/bin/chown dogeminer /dev/pts/0

/bin/su dogeminer -c "bash /home/dogeminer/doge2.sh"
