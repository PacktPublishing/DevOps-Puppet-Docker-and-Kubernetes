class haproxy::slave ($app = "myapp", $localport = 8000) {
  # haproxy slave, export haproxy.cfg fragment
  # configure simple webserver on different port
  @@concat::fragment { "haproxy.cfg $::fqdn":
    content => "\t\tserver ${::hostname} ${::ipaddress}:${localport}   check maxconn 100\n",
    order   => '0010',
    tag     => "$app",
  }
  include myfw
  firewall {"${localport} Allow HTTP to haproxy::slave":
    proto  => 'tcp',
    port   => $localport,
    action => 'accept',
  }

  class {'apache': }
  apache::vhost { 'haproxy.example.com':
    port          => '8000',
    docroot => '/var/www/haproxy',
  }
  file {'/var/www/haproxy':
    ensure  => 'directory',
    mode    => 0755,
    require => Class['apache'],
  }
  file {'/var/www/haproxy/index.html':
    mode    => 0644,
    content => "<html><body><h1>${::fqdn} haproxy::slave\n</body></html>\n",
    require => File['/var/www/haproxy'],
  }
}
