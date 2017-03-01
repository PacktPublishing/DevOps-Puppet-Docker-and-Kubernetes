file {'/tmp/cookbook':
  ensure => 'file',
}
#file_line {'cookbook-hello':
#  path    => '/tmp/cookbook',
#  line    => 'Hello World!',
#  require => File['/tmp/cookbook'],
#}
file_line {'cookbook-goodbye':
  path    => '/tmp/cookbook',
  line    => 'So long, and thanks for all the fish.',
  require => File['/tmp/cookbook'],
}
file_line {'cookbook-remove':
  ensure  => 'absent',
  path    => '/tmp/cookbook',
  line    => 'Hello World!',
  require => File['/tmp/cookbook'],
}
file_line {'cookbook-match':
  path    => '/tmp/cookbook',
  line    => 'Oh freddled gruntbuggly, thanks for all the fish.',
  match   => 'fish.$',
  require => File['/tmp/cookbook'],
}
