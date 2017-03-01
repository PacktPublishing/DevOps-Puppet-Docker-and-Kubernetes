# Manage a specific VIP with Heartbeat
class 
  heartbeat::vip($node1,$node2,$ip1,$ip2,$vip,$interface='eth0:1') {
  include heartbeat

  file { '/etc/ha.d/haresources':
    content => "${node1} IPaddr::${vip}/${interface}\n",
    require => Package['heartbeat'],
    notify  => Service['heartbeat'],
  }

  file { '/etc/ha.d/ha.cf':
    content => template('heartbeat/vip.ha.cf.erb'),
    require => Package['heartbeat'],
    notify  => Service['heartbeat'],
  }
}
