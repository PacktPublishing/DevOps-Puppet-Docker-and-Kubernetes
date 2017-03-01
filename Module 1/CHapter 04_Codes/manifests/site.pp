stage {'yumrepos': }

Stage['yumrepos']->Stage['main']

node default {
  #class {'mysql': }
  #  include base
  #include puppet
  #include apache
  #class {'yums':
  #  stage => 'yumrepos',
  #}
  notify { "This is $::operatingsystem version $::operatingsystemrelease, on $::architecture architecture, kernel version $::kernelversion": }
  include base
}

class yums {
  notify {'always before the rest': }
  yumrepo {'test':
    baseurl => 'file:///var/www',
    ensure  => 'present',
  }
}
node 'packt_server' {
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

node cookbook {
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

  $app_version = '1.2.14'
  $min_version = '1.2.10'

  if versioncmp($app_version, $min_version) >= 0 {
    notify { 'Version OK': }
  } else {
    notify { 'Upgrade needed': }
  }


}

node puppet {
  include admin::percona_repo

  package { 'percona-server-server-5.5':
    ensure  => installed,
    require => Class['admin::percona_repo'],
  }


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
