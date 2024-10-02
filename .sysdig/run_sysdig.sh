#!/bin/bash

file_name="$1"
filter="$2"
output_fields="$3"
output_file="$4"

if [ -z "$file_name" ] || [ -z "$filter" ] || [ -z "$output_fields" ] || [ -z "$output_file" ]; then
    echo "Usage: $0 <file_name> <filter> <output_fields> <output_file>"
    exit 1
fi

docker run --rm --privileged \
      -v /var/run/docker.sock:/host/var/run/docker.sock \
      -v /dev:/host/dev -v /proc:/host/proc:ro \
      -v /boot:/host/boot:ro \
      -v /lib/modules:/host/lib/modules:ro \
      -v /usr:/host/usr:ro \
      -v /tmp:/tmp \
      --entrypoint /bin/bash \
      --net=host sysdig/sysdig:latest -c "sysdig --modern-bpf -r \"$file_name\" \"$filter\" -j -p $output_fields >> $output_file"