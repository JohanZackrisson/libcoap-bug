#!/bin/sh

export LD_LIBRARY_PATH=/usr/local/lib/
./coap-client -m get coap://coap.me/test -v 9
