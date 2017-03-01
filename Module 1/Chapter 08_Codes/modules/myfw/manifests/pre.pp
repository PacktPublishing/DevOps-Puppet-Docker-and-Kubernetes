class myfw::pre {
  Firewall {
    require => undef,
  }

  firewall { '0000 Allow all traffic on loopback':
    proto => 'all',
    iniface => 'lo',
    action => 'accept',
  }
  firewall { '0001 Allow all ICMP':
    proto => 'icmp',
    action => 'accept',
  }
  firewall { '0002 Allow all established traffic':
    proto => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
  firewall { '0022 Allow all TCP on port 22 (ssh)':
    proto => 'tcp',
    port => '22',
    action => 'accept',
  }
}
