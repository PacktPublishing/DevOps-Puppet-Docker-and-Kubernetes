notify{"failed exec on ${hostname}": }->
exec {'failing exec':
  command   => "/bin/grep ${hostname} /etc/hosts",
  logoutput => true,
}
notify {'failed exec failed': 
  require => Exec['failing exec']
}
