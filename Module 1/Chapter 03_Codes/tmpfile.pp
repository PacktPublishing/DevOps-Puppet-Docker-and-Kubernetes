define tmpfile() {
  file { "/tmp/${title}":
    content => "Hello, world\n",
  }
}

tmpfile { ['a', 'b', 'c']: }
