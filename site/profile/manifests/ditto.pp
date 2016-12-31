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
}
