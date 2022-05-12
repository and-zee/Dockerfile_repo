#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

### SSH SERVICE ###
echo -e "[$(date)] : checking SSH service..." >> /home/zee/service.log
if pgrep -x sshd >/dev/null
then
    echo -e "[$(date)] : ${GREEN}SSH already running${NC}" >> /home/zee/service.log
else
    echo -e "[$(date)] : ${RED}SSH stopped${NC}" >> /home/zee/service.log
    echo -e "[$(date)] : starting SSH..." >> /home/zee/service.log
    /etc/init.d/ssh start
    if [ $? -eq 0 ]; then
        echo -e "[$(date)] : [${GREEN}OK${NC}] command run successfully." >> /home/zee/service.log
    else
        echo -e "[$(date)] : [${RED}FAIL${NC}] failed to run command with exit code status [$?]" >> /home/zee/service.log
    fi
fi

### OpenLDAP SERVICE ###
echo -e "[$(date)] : checking slapd service..." >> /home/zee/service.log
if pgrep -x slapd >/dev/null
then
    echo -e "[$(date)] : ${GREEN}slapd already running${NC}" >> /home/zee/service.log
else
    echo -e "[$(date)] : ${RED}slapd stopped${NC}" >> /home/zee/service.log
    echo -e "[$(date)] : starting slapd..." >> /home/zee/service.log
    /etc/init.d/slapd start
    if [ $? -eq 0 ]; then
        echo -e "[$(date)] : [${GREEN}OK${NC}] command run successfully." >> /home/zee/service.log
    else
        echo -e "[$(date)] : [${RED}FAIL${NC}] failed to run command with exit code status [$?]" >> /home/zee/service.log
    fi
fi

### Apache2 SERVICE ###
echo -e "[$(date)] : checking apache2 service..." >> /home/zee/service.log
if pgrep -x apache2 >/dev/null
then
    echo -e "[$(date)] : ${GREEN}apache2 already running${NC}" >> /home/zee/service.log
else
    echo -e "[$(date)] : ${RED}apache2 stopped${NC}" >> /home/zee/service.log
    echo -e "[$(date)] : starting apache2..." >> /home/zee/service.log
    /etc/init.d/apache2 start
    if [ $? -eq 0 ]; then
        echo -e "[$(date)] : [${GREEN}OK${NC}] command run successfully." >> /home/zee/service.log
    else
        echo -e "[$(date)] : [${RED}FAIL${NC}] failed to run command with exit code status [$?]" >> /home/zee/service.log
    fi
fi