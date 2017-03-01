class greeting {
  file {'/tmp/greeting':
    source => [
      'puppet:///modules/greeting/hello.txt',
      'puppet:///modules/greeting/universal.txt' ],
  }
}
