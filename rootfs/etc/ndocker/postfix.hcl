max_stale = "1m"

template {
  source = "/etc/ndocker/main.cf.tpl"
  destination = "/etc/postfix/main.cf"
}

template {
  source = "/etc/ndocker/master.cf.tpl"
  destination = "/etc/postfix/master.cf"
}

exec {
  command = "postfix -c /etc/postfix/main.cf"
  splay = "30s"
}
