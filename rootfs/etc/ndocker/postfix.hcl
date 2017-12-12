max_stale = "1m"

template {
  source = "/etc/ndocker/main.cf.tpl"
  destination = "/etc/postfix/main.cf"
}

exec {
  command = "/usr/lib/postfix/master -c /etc/postfix -d"
  splay = "30s"
}
