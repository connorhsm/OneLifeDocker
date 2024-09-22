#!/usr/bin/env bash

check_server_type_arg() {
	if [[ "$1" != "ohol" && "$1" != "2hol" ]]; then
		echo "Usage: $0 <ohol|2hol> ..."
		exit 1
	fi
}
