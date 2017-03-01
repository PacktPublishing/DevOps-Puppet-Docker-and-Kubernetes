class drupal {
  package {'httpd':
    ensure => 'installed',
  }
  service {'httpd':
    ensure => 'running',
    enable => true,
  }
  #include virtual
  #realize(Package['httpd'])
  #realize(Service['httpd'])
}
