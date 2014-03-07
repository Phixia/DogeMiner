#!/bin/bash
#miner username here
user= 

/usr/sbin/useradd -m -s /bin/bash $user

/usr/bin/apt-get update
/usr/bin/apt-get install -y build-essential autotools-dev libcurl4-gnutls-dev autoconf automake screen

/bin/mkdir -p ~/$user/.ssh/ && cp authorized_keys ~/$user/.ssh/authorized_keys

/bin/chown -R $user:$user ~/$user && /bin/chmod 600 ~/$user/.ssh/authorized_keys

cp miner.sh /etc/init.d/miner
cp crontab.bak ~/$user/crontab.bak && /bin/chown $user:$user ~/$user/crontab.bak
cp monitor.sh ~/$user/monitor.sh && /bin/chown $user:$user ~/$user/monitor.sh
cp doge2.sh ~/$user/doge2.sh && /bin/chown $user:$user ~/$user/doge2.sh

/bin/chown $user /dev/pts/0

/bin/su $user -c "bash ~/$user/doge2.sh"
