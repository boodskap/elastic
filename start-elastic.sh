#!/bin/bash
sudo sysctl -p /etc/sysctl.d/99-z01-sysctl.conf

su - elastic /home/elastic/bin/elasticsearch &

/bin/bash -c "trap : TERM INT; sleep infinity & wait"