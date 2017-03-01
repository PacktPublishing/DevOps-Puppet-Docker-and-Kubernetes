stage {'yumrepos': }

Stage['yumrepos']->Stage['main']

#node default {
  #class {'mysql': }
  #  include base
  #include puppet
  #include apache
  #class {'yums':
  #  stage => 'yumrepos',
  #}
  #notify { "This is $::operatingsystem version $::operatingsystemrelease, on $::architecture architecture, kernel version $::kernelversion": }
  #include base
  #  hiera_include('classes','nothing')
  #include base
  #  include db::server
  #  file {'/tmp/darn':
  #  content => "#!/bin/bash\necho $OOPS>>/tmp/darn.log",
  #  mode    => 0755,
  #}
  #exec {'Oops':
  #  command => "/tmp/darn",
  #  require => File['/tmp/darn'],
  #}
  #$one = "1"
  #  file {"lisaone":
  #  path   => "/tmp/lisa1",
  #  ensure => 'directory',
  #}
  #file {"lisa1":
  #  path   => "/tmp/lisa1",
  #  ensure => 'file',
  #}
  #lisa {'one':
  #  place => "/tmp/$LISA",
  #  type  => "directory",
  #}
  #lisa {'two':
  #  place => "/tmp/$LISA",
  #  type  => "file",
  #}
  #}

  
class yums {
  notify {'always before the rest': }
  yumrepo {'test':
    baseurl => 'file:///var/www',
    ensure  => 'present',
  }
}
node 'packt_server' {
}

node 'jumpbox' {
  include ::jumpbox
  Sshkey <<| |>>
}
node 'node2' {
  #  include wordpress
  #include drupal
  include user::virtual
  include user::sysadmins
  include user::developers
}
#node 'cookbook' inherits 'packt_server' {
#  tag('tagging')
#  class {'tag_test': }
#  class {'another_class': }
#
#  if tagged('cookbook') {
#    notify { 'tagged cookbook': }
#  }
#  if tagged('packt_server') {
#    notify { 'tagged packt_server': }
#  }
#}

# node cookbook {
  #include base
  #class {'first_class': }
  #class {'second_class': }
  #include admin::stages
  #$mysql_password = 'secret'
  #file { '/usr/local/bin/backup-mysql':
  #  content => template('base/backup-mysql.sh.erb'),
  #  mode    => '0755',
  #}
  #$ipaddresses = ['192.168.0.1',
  #                '158.43.128.1',
  #                '10.0.75.207' ]
  #file { '/tmp/addresslist.txt':
  #  content => template('admin/addresslist.erb')
  #}
  #$message = secret('/etc/puppet/environments/production/modules/admin/files/secret_message.gpg')
  #notify { "The secret message is: ${message}": }

  #  $app_version = '1.2.14'
  #$min_version = '1.2.10'

  #if versioncmp($app_version, $min_version) >= 0 {
  #  notify { 'Version OK': }
  #} else {
  #  notify { 'Upgrade needed': }
  #}


  #}
schedule { 'outside-office-hours':
  period => daily,
  range  => ['17:00-23:59','00:00-09:00'],
  repeat => 1,
}
#node 'cookbook' {
  #  notify { 'Doing some maintenance':
  #  schedule => 'outside-office-hours',
  #}
  #host { 'packtpub.com':
  #  ensure => present,
  #  ip     => '83.166.169.231',
  #  target => '/etc/hosts',
  #}
  #  include db::client
  #class {'greeting': }
  #admin_user {'steven':
  #  key     => 'AAAAB3N',
  #  keytype => 'dsa',
  #}
  #admin_user {'thomas':
  #  key     => 'ABBA...',
  #  keytype => 'rsa',
  #}
  #tidy { '/var/lib/puppet/reports':
  #  age     => '2w',
  #  recurse => true,
  #}
  #file { '/etc/passwd':
  #  audit => [ owner, mode ],
  #}
  #
  #file { "/tmp/puppet-debug.txt":
  #  content => inline_template("<% vars = scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }; vars.sort.each do |k,v| %><%= k %>=<%= v %>\n<% end %>"),
  #}
  #
  #include debug
  #exec{'before': 
  #  command => '/usr/local/bin/puppet-debug before resolv.conf',
  #  require => Class['debug']
  #}->file { '/etc/resolv.conf':
  #  content => "nameserver 127.0.0.1\n",
  #  noop    => true,
  #}->notify {'after':}
# include myfw
# firewall {'0080 Allow HTTP':
#   proto  => 'tcp',
#   action => 'accept',
#   port  => 80,
# }
# class { 'heartbeat::vip':
#   ip1   => '192.168.122.132',
#   ip2   => '192.168.122.133',
#   node1 => 'cookbook.example.com',
#   node2 => 'cookbook2.example.com',
#   vip   => '192.168.122.200/24',
# }
#

node cookbook2 {
  class { 'heartbeat::vip':
    ip1   => '192.168.122.132',
    ip2   => '192.168.122.133',
    node1 => 'cookbook.example.com',
    node2 => 'cookbook2.example.com',
    vip   => '192.168.122.200/24',
  }
}

#node cookbook {
#  cron { 'run-backup':
#    ensure  => present,
#    command => '/usr/local/bin/backup',
#    hour    => inline_template('<%= @hostname.sum % 24 %>'),
#    minute  => '00',
#  }
#  include cron
#}

node puppet {
  #  include admin::percona_repo
  #
  #package { 'percona-server-server-5.5':
  #  ensure  => installed,
  #  require => Class['admin::percona_repo'],
  #}
  include base

}
class first_class {
    notify { 'First Class': }
}
class second_class {
    notify {'Second Class': }
}

class tag_test {
  if tagged('tagging') {
    notify { 'containing node/class was tagged.': }
  }
}
class another_class {
  notify {'another class': }
}
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

#node debian {
#  include nfs::server
#  nfs::export {'/srv/home': 
#    tag => "srv_home" }
#  notify {"bleah": }
#}
#node cookbook {
#  Mount <<| tag == "srv_home" |>> {
#    name   => '/mnt',
#  }
#}
#node cookbook {
#  notify {"$::hello": }
#}
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
node default {
}
node cookbook {
  #  gitrepo { 'https://github.com/puppetlabs/puppetlabs-git':
  #  ensure => present,
  #  path   => '/tmp/puppet',
  #}
  #  cron {'custom fuction example job':
  #  command => '/bin/echo Hallo, welt >>/tmp/hallo.txt',
  #  hour    => '*',
  #  minute  => hashtable(10),
  #}
  $hours = hashtable(24)
  $minutes = hashtable()
  $days = hashtable(30)
  $days_fqdn = hashtable(30,'fqdn')
  $days_ipaddress = hashtable(30,'ipaddress')
  notify {" hours=${hours}\n minutes=${minutes}\n days=${days}\n days_fqdn=${days_fqdn}\n days_ipaddress=${days_ipaddress}\n":}
}
