#!/bin/bash
#miner username here
$user= 

/usr/sbin/useradd -m -s /bin/bash $user

/usr/bin/apt-get update
/usr/bin/apt-get install -y build-essential autotools-dev libcurl4-gnutls-dev autoconf automake screen

/bin/mkdir -p /home/$user/.ssh/ && cp authorized_keys /home/$user/.ssh/authorized_keys

/bin/chown -R $user:$user /home/$user && /bin/chmod 600 /home/$user/.ssh/authorized_keys

cp doge2.sh /home/$user/doge2.sh && /bin/chown $user:$user /home/$user/doge2.sh

/bin/chown $user /dev/pts/0

/bin/su $user -c "bash /home/$user/doge2.sh"
