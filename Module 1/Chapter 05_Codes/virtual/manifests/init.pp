class virtual {
  @package {'httpd': ensure => installed }
  @service {'httpd': 
    ensure  => running,
    enable  => true,
    require => Package['httpd']
  }
}
