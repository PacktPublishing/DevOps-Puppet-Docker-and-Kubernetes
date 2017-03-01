package {'git':
  ensure => 'installed'
}
File {
  owner => 'puppet',
  group => 'puppet',
}
file {'/var/lib/puppet/.ssh':
  ensure => 'directory',
}
file {'/var/lib/puppet/.ssh/id_rsa':
  content => "
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----
",
  mode    => 0600,
  require => File['/var/lib/puppet/.ssh']
}
file {'/etc/puppet/cookbook':
  ensure => 'directory',
}

exec {'download git.example.com host key': 
  command => 'sudo -u puppet ssh-keyscan git.example.com >> /var/lib/puppet/.ssh/known_hosts',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  unless  => 'grep git.example.com /var/lib/puppet/.ssh/known_hosts',
  require => File['/var/lib/puppet/.ssh/known_hosts']
}
file {'/var/lib/puppet/.ssh/known_hosts':
  require => File['/var/lib/puppet/.ssh']
}

exec {'create cookbook':
  command => 'sudo -u puppet git clone git@git.example.com:repos/puppet.git /etc/puppet/cookbook',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  require => [Package['git'],File['/var/lib/puppet/.ssh/id_rsa'],Exec['download git.example.com host key']],
  unless  => 'test -f /etc/puppet/cookbook/.git/config',
}
