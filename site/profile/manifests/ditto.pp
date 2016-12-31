class profile::ditto {
  file {'/usr/lib/systemd/system/plexmediaserver.service':
    ensure  => file,
    content => template('plex/plexmediaserver.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  exec {'systemctrl daemon-reload':
    command     => "/usr/bin/systemctl daemon-reload",
    notify      => Service['plexmediaserver'],
    refreshonly => true,
  }

  service {'plexmediaserver':
    ensure  => running,
    enable => true,
  }

  file {'/srv/plex':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }
  file {'/srv/plex/database':
    ensure   => directory,
    owner    => 'plex',
    group    => 'plex',
    mode     => '0775',
    require  => File['/srv/plex'],
  }
  file {'/srv/plex/transcode':
    ensure   => directory,
    owner    => 'plex',
    group    => 'plex',
    mode     => '0775',
    require  => File['/srv/plex'],
  }
  file {'/srv/plex/data':
    ensure   => directory,
    owner    => 'plex',
    group    => 'plex',
    mode     => '0775',
    require  => File['/srv/plex'],
  }

  file {'/srv/plex/data/disk1':
    ensure  => link,
    target  => '/media/disks/storage1',
    require => File['/srv/plex/data'],
  }
  file {'/srv/plex/data/disk2':
    ensure  => link,
    target  => '/media/disks/storage2',
    require => File['/srv/plex/data'],
  }
  file {'/srv/plex/data/disk3':
    ensure  => link,
    target  => '/media/disks/storage3',
    require => File['/srv/plex/data'],
  }
  file {'/srv/plex/data/disk4':
    ensure  => link,
    target  => '/media/disks/storage4',
    require => File['/srv/plex/data'],
  }
  file {'/srv/plex/data/disk5':
    ensure  => link,
    target  => '/media/disks/storage5',
    require => File['/srv/plex/data'],
  }
}
