#exec {'/bin/cat /tmp/missing': }
exec {'exec with outout':
  command   => '/bin/cat /etc/hostname',
  logoutput => true,
}
