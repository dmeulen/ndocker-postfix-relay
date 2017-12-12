#!/usr/bin/env sh

busybox syslogd -n -O /dev/stdout &
bbchild=$!

consul-template -config /etc/ndocker/postfix.hcl &
child=$!

trap "kill $bbchild $child" INT TERM
wait $child
