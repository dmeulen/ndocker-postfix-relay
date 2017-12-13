# ndocker-postfix-relay
Simple postfix relay for use with nomad

Variable | Description | Notes
---|---|---
POSTFIX_MYHOSTNAME | posfix myhostname |
POSTFIX_MYDOMAIN | your domain name |
POSTFIX_MYNETWORKS | what networks are allowed to send mail |
POSTFIX_RELAYHOST | where to relay mail |
POSTFIX_SMTPD_RELAY_RESTRICTIONS | your relay restrictions |
POSTFIX_CLIENT_SALS_ENABLED | set to `true` or `false` |
SASL_GATEWAY | your sasl enabled relay host |
SASL_USERNAME | sasl username |
SASL_PASSWD | sasl password |
