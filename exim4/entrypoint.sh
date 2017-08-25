#!/bin/bash
set -e

opts=(
	dc_local_interfaces '0.0.0.0 ; ::0'
	dc_other_hostnames ''
	dc_relay_nets "$(ip addr show dev eth0 | awk -v ORS=':' '$1 == "inet" { print $2 }' | rev | cut -c 2- | rev)"
)

if [ "$YANDEX_USER" -a "$YANDEX_PASSWORD" ]; then
	opts+=(
		dc_eximconfig_configtype 'smarthost'
		dc_smarthost 'smtp.yandex.ru::587'
	)
	echo "*.yandex.ru:$YANDEX_USER:$YANDEX_PASSWORD" > /etc/exim4/passwd.client
else
	opts+=(
		dc_eximconfig_configtype 'internet'
	)
fi

set-exim4-update-conf "${opts[@]}"

exec "$@"
