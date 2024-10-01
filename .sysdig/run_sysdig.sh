#!/bin/bash

file_name="$1"
filter="$2"
output_fields="$3"
output_file="$4"

docker run --rm -d --privileged \
      -v /var/run/docker.sock:/host/var/run/docker.sock \
      -v /dev:/host/dev -v /proc:/host/proc:ro \
      -v /boot:/host/boot:ro \
      -v /lib/modules:/host/lib/modules:ro \
      -v /usr:/host/usr:ro \
      -v /tmp:/tmp \
      --net=host sysdig/sysdig:latest sysdig --modern-bpf -r "$file_name" "$filter" -j -p $output_fields >> $output_file