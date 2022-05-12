#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "[$(date)] : checking nginx service..." >> /home/zee/service.log
if pgrep -x nginx >/dev/null
then
    echo -e "[$(date)] : ${GREEN}nginx already running${NC}" >> /home/zee/service.log
else
    echo -e "[$(date)] : ${RED}nginx stopped${NC}" >> /home/zee/service.log
    echo -e "[$(date)] : starting nginx..." >> /home/zee/service.log
    /etc/init.d/nginx start
    if [ $? -eq 0 ]; then
        echo -e "[$(date)] : [${GREEN}OK${NC}] command run successfully." >> /home/zee/service.log
    else
        echo -e "[$(date)] : [${RED}FAIL${NC}] failed to run command with exit code status [$?]" >> /home/zee/service.log
    fi
fi