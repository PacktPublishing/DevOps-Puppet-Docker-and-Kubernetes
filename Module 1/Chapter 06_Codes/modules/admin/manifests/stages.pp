class admin::stages {
  stage { 'first': before => Stage['main'] }
  stage { 'last': require => Stage['main'] }

  class me_first {
    notify { 'This will be done first': }
  }

  class me_last {
    notify { 'This will be done last': }
  }

  class { 'me_first':
    stage => 'first',
  }
  class { 'me_last':
    stage => 'last',
  }
}
