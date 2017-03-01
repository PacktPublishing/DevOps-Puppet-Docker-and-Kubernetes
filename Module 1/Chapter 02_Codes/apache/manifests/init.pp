class apache {
  File {
    owner        => 'apache',
    group    => 'apache',
    mode => 0644,
  }
  file {'/var/www/html/index.html':
    content => "<html><body><h1><a href='cookbook.html'>Cookbook!</a></h1></body></html>\n",
  }
  file {'/var/www/html/cookbook.html':
    content => "<html><body><h2>PacktPub</h2></body></html>\n",
  }
}
