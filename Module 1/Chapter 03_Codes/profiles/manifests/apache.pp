class profiles::apache {
  $apache = $::osfamily ? { 
    'RedHat' => 'httpd',
    'Debian' => 'apache2',
    }
  service { "$apache":
    enable => true,
    ensure => true,
  }
  package { "$apache":
    ensure => 'installed',
  }
}
