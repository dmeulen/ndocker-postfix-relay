#!/usr/bin/env sh

if [ $POSTFIX_CLIENT_SASL_ENABLED == "true" ]; then
  echo "$SASL_GATEWAY $SASL_USERNAME:$SASL_PASSWD" > /etc/postfix/sasl_passwd
  chmod 640 /etc/postfix/sasl_passwd
  chown postfix:postfix /etc/postfix/sasl_passwd
  postmap /etc/postfix/sasl_passwd
fi

if test $NOMAD_PORT_smtp; then
  export SMTP_PORT=$NOMAD_PORT_smtp
else
  export SMTP_PORT="smtp"
fi

busybox syslogd -n -O /dev/stdout &
bbchild=$!

consul-template -config /etc/ndocker/postfix.hcl &
child=$!

trap "kill $bbchild $child" INT TERM
wait $child
