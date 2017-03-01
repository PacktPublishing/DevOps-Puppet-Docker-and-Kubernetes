define nfs::export (
  $where = $title,
  $who = '*',
  $options = 'async,ro',
  $mount_options = 'defaults',
  $tag     = 'nfs'
) {
  # make sure the directory exists
  # export the entry locally, then export a resource to be picked up later.
  file {"$where":
    ensure => 'directory',
  }
  include nfs::exports
  concat::fragment { "nfs::export::$where":
    content => "${where} ${who}(${options})\n",
    target  => '/etc/exports'
  }
  @@mount { "nfs::export::${where}::${::ipaddress}":
    name    => "$where",
    ensure  => 'mounted',
    fstype  => 'nfs',
    options => "$mount_options",
    device  => "${::ipaddress}:${where}",
    tag     => "$tag",
  }
}
