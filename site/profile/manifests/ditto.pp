class profile::ditto {
  file {'/usr/lib/systemd/system/plexmediaserver.service':
    ensure  => file,
    content => template('plex/plexmediaserver.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  exec {'systemctrl daemon-reload':
    command     => "systemctl daemon-reload",
    notify      => Exec['systemctl restart plexmediaserver'],
    refreshonly => true,
  }

  exec {'systemctl restart plexmediaserver':
    command     => 'systemctl restart plexmediaserver',
    refreshonly =>  true,
  }
}
