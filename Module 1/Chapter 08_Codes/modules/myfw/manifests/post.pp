class myfw::post {
  firewall { '9999 Drop all other traffic':
    proto  => 'all',
    action => 'drop',
    before => undef,
  } 
}

