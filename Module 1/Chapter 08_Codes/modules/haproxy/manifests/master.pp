class haproxy::master ($app = 'myapp') {
  # The HAProxy master server
  # will collected haproxy::slave resources and add to it's balancer
  package { 'haproxy': ensure => installed }

#  file { '/etc/default/haproxy':
#    content => "ENABLED=1\n",
#    require => Package['haproxy'],
#  }

  service { 'haproxy':
    ensure  => running,
    enable  => true,
    require => Package['haproxy'],
  }

  include haproxy::config

  concat::fragment { 'haproxy.cfg header':
    target  => 'haproxy.cfg',
    source  => 'puppet:///modules/haproxy/haproxy.cfg',
    order   => '001',
    require => Package['haproxy'],
    notify  => Service['haproxy'],
  }

  # pull in the exported entries
  Concat::Fragment <<| tag == "$app" |>> {
    target => 'haproxy.cfg',
    notify => Service['haproxy'],
  }

  # firewall configuration
  include myfw
  firewall {'8080 haproxy statistics':
    proto  => 'tcp',
    port   => 8080,
    action => 'accept'
  }
  firewall {'0080 http haproxy':
    proto  => 'tcp',
    port   => 80,
    action => 'accept'
  }

}
