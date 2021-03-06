#!/bin/sh

#Define your OVH DynHost ID & password and the domain name for which you wish to update DynHost
DYNHOST_ID=''
DYNHOST_PASSWORD=''
DOMAIN_NAME=''



#####################
####DO NOT TOUCH#####
#####################

PUBLIC_IP=$(host -4 myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}')

#Call OVH for update
curl --silent --user "$DYNHOST_ID:$DYNHOST_PASSWORD" "https://www.ovh.com/nic/update?system=dyndns&hostname=$DOMAIN_NAME&myip=$PUBLIC_IP"
