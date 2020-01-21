#!/bin/sh

#Define your OVH DynHost ID & password and the domain name for which you wish to update DynHost
DYNHOST_ID='{DYNHOST_ID}'
DYNHOST_PASSWORD='{DYNHOST_PASSWORD}'
DOMAIN_NAME='{DOMAIN_NAME}'



#####################
####DO NOT TOUCH#####
#####################

PUBLIC_IP=host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}'

#Call OVH for update
RETURN=curl --user "$DYNHOST_ID:$DYNHOST_PASSWORD" "https://www.ovh.com/nic/update?system=dyndns&hostname=$DOMAIN_NAME&myip=$PUBLIC_IP" 2>&1 > /dev/null
