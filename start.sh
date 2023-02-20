#!/bin/bash

if [ -z "$1" ]; then
    docker exec -it px4 bash
elif [ $1 == "detach" ]; then
    docker exec -t -d px4 bash -c /root/source_this.sh
fi
