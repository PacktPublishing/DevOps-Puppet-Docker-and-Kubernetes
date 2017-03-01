service {'httpd':
  ensure  => 'running',
  require => Package['httpd'],
}
package {'httpd':
  ensure => 'installed',
}
file {'/etc/httpd/conf.d/cookbook.conf':
  content => "<VirtualHost *:80>\nServername cook-book\nDocumentRoot /var/www/cookbook\n</VirtualHost>\n",
  require => Package['httpd'],
  notify  => Service['httpd'],
}
file {'/var/www/cookbook':
  ensure => 'directory',
}
file {'/var/www/cookbook/index.html':
  content => "<html><h1>Hello World!</h1></html>\n",
  require => File['/var/www/cookbook'],
}

