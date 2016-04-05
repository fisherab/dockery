#!/bin/sh
asadmin start-domain && cd icat.server && ./setup -v install
while true; do sleep 60; done



