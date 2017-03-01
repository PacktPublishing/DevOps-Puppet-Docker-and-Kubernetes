#node webserver {
#  class {'apache': }
#  apache::vhost { 'navajo.example.com':
#    port          => '8080',
#    docroot => '/var/www/navajo',
#  }
#  file {'/var/www/navajo/index.html':
#    content => "<html>\nnavajo.example.com\nhttp://en.wikipedia.org/wiki/Navajo_people\n</html>\n",
#    mode    => '0644',
#    require => Apache::Vhost['navajo.example.com']
#  }
#}
node webserver {
  class {'nginx':}
  nginx::resource::vhost { 'mescalero.example.com':
      www_root => '/var/www/mescalero',
  }
  file {'/var/www/mescalero':
    ensure  => 'directory',
    mode    => '0755',
    require => Nginx::Resource::Vhost['mescalero.example.com'],
  }
  file {'/var/www/mescalero/index.html':
    content => "<html>\nmescalero.example.com\nhttp://en.wikipedia.org/wiki/Mescalero\n</html>\n",
    mode    => 0644,
    require => File['/var/www/mescalero'],
  }
}
node dbserver {
  class { '::mysql::server':
    root_password    => 'PacktPub',
    override_options => { 
      'mysqld' => { 'max_connections' => '1024' } 
    }
  }
  mysql::db { 'drupal':
    host    => 'localhost',
    user    => 'drupal',
    password    => 'Cookbook',
    sql     => '/root/drupal.sql',
    require => File['/root/drupal.sql']
  }

  file { '/root/drupal.sql':
    ensure => present,
    source => 'puppet:///modules/mysql/drupal.sql',
  }

  mysql_grant { 'drupal@localhost/drupal.nodes':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => 'drupal.nodes',
    user       => 'drupal@localhost',
  }


}

node master {
  class {'haproxy::master':
    app => 'cookbook'
  }
}
node slave1,slave2 {
  class {'haproxy::slave':
    app => 'cookbook'
  }
}
