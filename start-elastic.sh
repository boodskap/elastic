#!/bin/bash
sudo sysctl -p /etc/sysctl.d/99-z01-sysctl.conf

echo "Fixing daa dir ownership"

sudo chown -R elastic:elastic /home/elastic/data

su - elastic /home/elastic/bin/elasticsearch &

/bin/bash -c "trap : TERM INT; sleep infinity & wait"
