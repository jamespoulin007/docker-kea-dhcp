#!/bin/bash
set -e

kea-dhcp4 -c /kea-config/kea.conf
rsyslogd -n &
wait
exit 0
