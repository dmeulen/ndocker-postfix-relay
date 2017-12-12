max_stale = "1m"

template {
  source = "/etc/ndocker/main.cf.tpl"
  destination = "/etc/postfix/main.cf"
}

exec {
  command = "postfix -c /etc/postfix"
  splay = "30s"
}
