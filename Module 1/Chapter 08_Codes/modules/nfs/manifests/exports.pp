class nfs::exports {
  exec {'nfs::exportfs':
    command     => 'exportfs -a',
    refreshonly => true,
    path        => '/usr/bin:/bin:/sbin:/usr/sbin',
  }
  concat {'/etc/exports':
    notify => Exec['nfs::exportfs'],
  }
}
