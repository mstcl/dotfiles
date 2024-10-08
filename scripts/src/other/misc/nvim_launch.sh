#!/usr/bin/env bash

prc=$(pgrep "nvim" | wc -l)
if [[ "$prc" -le 1 ]];
	then
	if [[ "$#" -eq 0 ]];
	then
		NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim
	else
		NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim "$(pwd)"/"$@"
	fi
else
	/usr/bin/nvr --remote "$@"
fi
