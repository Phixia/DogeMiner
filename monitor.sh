#!/bin/bash

/etc/init.d/miner status &>/dev/null
if [ $? -ne 0 ]; then
  /etc/init.d/miner restart
  logger "minerd: Restart attempted"
else
  logger "minerd: All is well"
fi
