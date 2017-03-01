node default {
  file { '/tmp/hello':
    content => "Hello, world!\n",
  }
  include memcached
}
