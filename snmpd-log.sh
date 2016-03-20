#!/bin/sh

exec chpst -u snmpd svlogd -tt /var/log/snmpd/
