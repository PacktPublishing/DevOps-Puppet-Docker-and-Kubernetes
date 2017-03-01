# Manage Heartbeat
class heartbeat {
  package { 'heartbeat':
    ensure => installed,
  }

  service { 'heartbeat':
    ensure  => running,
    enable  => true,
    require => Package['heartbeat'],
  }

  file { '/etc/ha.d/authkeys':
    content => "auth 1\n1 sha1 TopSecret",
    mode    => '0600',
    require => Package['heartbeat'],
    notify  => Service['heartbeat'],
  }
  include myfw
  firewall {'0694 Allow UDP ha-cluster':
    proto  => 'udp',
    port   => 694,
    action => 'accept',
  }
}
