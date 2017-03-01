ini_setting {'server_true':
  path    => '/tmp/server.conf',
  section => 'main',
  setting => 'server',
  value   => 'true',
}
ini_subsetting {'server_name':
  path    => '/tmp/server.conf',
  section => 'main',
  setting => 'server_host',
  subsetting => "$hostname",
}
