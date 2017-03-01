stage {'yumrepos': }

Stage['yumrepos']->Stage['main']

node default {
  #class {'mysql': }
  #  include base
  #include puppet
  #include apache
  #class {'yums':
  #  stage => 'yumrepos',
  #}
  notify { "This is $::operatingsystem version $::operatingsystemrelease, on $::architecture architecture, kernel version $::kernelversion": }
}

class yums {
  notify {'always before the rest': }
  yumrepo {'test':
    baseurl => 'file:///var/www',
    ensure  => 'present',
  }
}
node 'packt_server' {
}

node 'cookbook' {
  tag('tagging')
  class {'tag_test': }
  class {'another_class': }

  if tagged('cookbook') {
    notify { 'tagged cookbook': }
  }
  if tagged('packt_server') {
    notify { 'tagged packt_server': }
  }
}

#node cookbook {
#  class {'first_class': }
#  class {'second_class': }
#  include admin::stages
#}
class first_class {
    notify { 'First Class': }
}
class second_class {
    notify {'Second Class': }
}

class tag_test {
  if tagged('tagging') {
    notify { 'containing node/class was tagged.': }
  }
}
class another_class {
  notify {'another class': }
}
