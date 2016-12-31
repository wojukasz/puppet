class profile::ditto {
  package {'openvpn':
    ensure => latest,
  }

  service {'openvpn-client@client.service':
    ensure  => running,
    enable  => true,
    require => Package['openvpn'],
  }

  file {'/usr/lib/systemd/system/plexmediaserver.service':
    ensure  => file,
    content => template('plex/plexmediaserver.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  exec {'systemctrl daemon-reload':
    command     => "/usr/bin/systemctl daemon-reload",
    # notify      => Service['couchpotato'],
    # notify      => Service['deluge'],
    # notify      => Service['headphones'],
    # notify      => Service['plexmediaserver'],
    # notify      => Service['sickrage'],
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

  file {'/usr/lib/systemd/system/deluge.service':
    ensure  => file,
    content => template('deluge/deluge.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  user {'deluge':
    ensure => present,
    uid    => '125',
    gid    => '125',
    system => true,
  }

  service {'deluge':
    ensure => running,
    enable => true,
  }

  file {'/srv/deluge':
    ensure => directory,
    owner  => '125',
    group  => '125',
    mode   => '0775',
  }

  file {'/srv/deluge/config':
    ensure  => directory,
    owner   => '125',
    group   => '125',
    mode    => '0775',
    require => File['/srv/deluge'],
  }

  file {'/srv/deluge/downloads':
    ensure  => directory,
    owner   => '125',
    group   => '125',
    mode    => '0775',
    require => File['/srv/deluge'],
  }

  # file {'/usr/lib/systemd/system/sickrage.service':
  #   ensure  => file,
  #   content => template('sickrage/sickrage.service.epp'),
  #   notify  => Exec['systemctrl daemon-reload'],
  # }

  # file {'/usr/lib/systemd/system/couchpotato.service':
  #   ensure  => file,
  #   content => template('couchpotato/couchpotato.service.epp'),
  #   notify  => Exec['systemctrl daemon-reload'],
  # }

  # file {'/usr/lib/systemd/system/headphones.service':
  #   ensure  => file,
  #   content => template('headphones/headphones.service.epp'),
  #   notify  => Exec['systemctrl daemon-reload'],
  # }
}
