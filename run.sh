#! /bin/bash

if [[ -n "$RUNAT" ]]; then
    echo "Scheduling runs everyday at $RUNAT" >&2
    while true; do
        # Sleep until next orrucence of RUNAT
        sleep $(( ($(echo -e "$RUNAT tomorrow\nnow" | date -f - +%s-)0) % 86400 ))

        echo "$(date) Running apt-mirror" >&2
        # run apt-mirror
        apt-mirror /mirror.list
        echo "$(date) Run finished" >&2
    done
else
    echo "Running apt-mirror immediatly" >&2
    apt-mirror /mirror.list
    echo "Run finished. Exiting" >&2
    exit
fi
