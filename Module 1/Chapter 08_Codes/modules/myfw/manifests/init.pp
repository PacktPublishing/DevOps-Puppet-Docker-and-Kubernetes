class myfw {
  include firewall
  # our rulesets
  include myfw::post
  include myfw::pre

  # clear all the rules
  resources { "firewall":
    purge => true
  }
  
  # resource defaults
  Firewall {
    before => Class['myfw::post'],
    require => Class['myfw::pre'],
  }
}

