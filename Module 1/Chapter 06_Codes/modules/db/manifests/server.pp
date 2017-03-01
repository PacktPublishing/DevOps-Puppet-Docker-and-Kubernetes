class db::server {
  @@host {"$::fqdn":
    host_aliases => $::hostname,
    ip           => $::ipaddress,
    tag          => 'db::server',
  }
  # rest of db class
}
