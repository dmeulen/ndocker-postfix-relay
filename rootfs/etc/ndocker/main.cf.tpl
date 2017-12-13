smtputf8_enable = no
compatibility_level = 2
queue_directory = /var/spool/postfix
command_directory = /usr/sbin
daemon_directory = /usr/lib/postfix
data_directory = /var/lib/postfix
mail_owner = postfix
unknown_local_recipient_reject_code = 550
debug_peer_level = 2
sendmail_path = /usr/sbin/sendmail
newaliases_path = /usr/bin/newaliases
mailq_path = /usr/bin/mailq
setgid_group = postdrop
html_directory = no
manpage_directory = /usr/share/man
sample_directory = /etc/postfix
readme_directory = /usr/share/doc/postfix/readme
inet_protocols = ipv4
meta_directory = /etc/postfix
shlib_directory = /usr/lib/postfix

myhostname = {{ env "POSTFIX_MYHOSTNAME" }}
relayhost = {{ env "POSTFIX_RELAYHOST" }}
mynetworks = {{ env "POSTFIX_MYNETWORKS" }}
smtpd_relay_restrictions = {{ env "POSTFIX_SMTPD_RELAY_RESTRICTIONS" }}
{{ $client_sasl_enabled := env "POSTFIX_CLIENT_SASL_ENABLED" }}
{{ if eq $client_sasl_enabled "true" }}
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_mechanism_filter = plain
smtp_sasl_auth_enable = yes
{{ end }}
