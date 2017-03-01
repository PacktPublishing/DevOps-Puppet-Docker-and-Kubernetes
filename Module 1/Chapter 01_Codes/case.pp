case $::operatingsystem {
  'Ubuntu',
  'Debian': {
    notify {'Debian like': }
  }
  'RedHat',
  'Fedora',
  'CentOS': {
    notify {'RedHat like': }
  }
  default: {
    notify { "I don't know what kind of system you have!": }
  }
}

