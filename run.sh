#!/bin/sh

CONFIG_TEMPLATE="/telegraf.template.conf"
CONFIG_FILE="/etc/telegraf/telegraf.conf"

echo $SNMP_AGENTS

sed -i -e "s/\${HOST_NAME}/$HOST_NAME/" \
 -e "s!\${INFLUXDB_HOST}!$INFLUXDB_HOST!" \
 -e "s/\${INFLUXDB_PORT}/$INFLUXDB_PORT/" \
 -e "s/\${SNMP_COMMUNITY}/$SNMP_COMMUNITY/" \
 -e "s/\${SNMP_AGENTS}/$SNMP_AGENTS/" \
 -e "s/\${DATABASE}/$DATABASE/" $CONFIG_TEMPLATE

rm $CONFIG_FILE
ln -s $CONFIG_TEMPLATE $CONFIG_FILE

echo "=> Starting Telegraf ..."

exec telegraf -config /etc/telegraf/telegraf.conf
