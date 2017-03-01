class nfs::server {
  # ensure nfs server is running
  # firewall should allow nfs communication
  include nfs::exports
  case $::osfamily {
    'RedHat': { include nfs::server::redhat }
    'Debian': { include nfs::server::debian }
  }
  include myfw
  firewall {'2049 NFS TCP communication':
    proto  => 'tcp',
    port   => '2049',
    action => 'accept',
  }
  firewall {'2049 UDP NFS communication':
    proto  => 'udp',
    port   => '2049',
    action => 'accept',
  }
  firewall {'0111 TCP PORTMAP':
    proto  => 'tcp',
    port   => '111',
    action => 'accept',
  }
  firewall {'0111 UDP PORTMAP':
    proto  => 'udp',
    port   => '111',
    action => 'accept',
  }
  firewall {'4000 TCP STAT':
    proto  => 'tcp',
    port   => '4000-4010',
    action => 'accept',
  }
  firewall {'4000 UDP STAT':
    proto  => 'udp',
    port   => '4000-4010',
    action => 'accept',
  }
}
