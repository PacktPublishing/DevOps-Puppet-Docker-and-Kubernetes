node default {
  file {"/tmp/${::fqdn}.txt",
    mode    => '0644',
    content => "${::fqdn}",
  }
}
