chedule { 'outside-office-hours':
  period => daily,
  range  => ['17:00-23:59','00:00-09:00'],
  repeat => 1,
}
node 'cookbook' {
  notify { 'Doing some maintenance':
    schedule => 'outside-office-hours',
  }
}

node 'cookbook' {
  cron { 'run-backup':
    ensure  => present,
    command => '/usr/local/bin/backup',
    hour    => inline_template('<%= @hostname.sum % 24 %>'),
    minute  => '00',
  }
  cron { 'dump-database':
    ensure  => present,
    command => '/usr/local/bin/dump_database',
    hour    => inline_template('<%= @hostname.sum % 24 %>'),
    minute  => '00',
  }

  cron { 'run-backup':
    ensure  => present,
    command => '/usr/local/bin/backup',
    hour    => inline_template('<%= ( @hostname.sum + 1) % 24 %>'),
    minute  => '00',
  }

}
node 'cookbook' {
  host { 'packtpub.com':
    ensure => present,
    ip     => '83.166.169.231',
    target => '/etc/hosts',
  }
}

