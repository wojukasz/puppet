class profile::ditto {
  service {'nginx':
    ensure => running,
  }
  package {'openvpn':
    ensure => absent,
  }

  service {'openvpn-client@client.service':
    ensure  => stopped,
    enable  => false,
    require => Package['openvpn'],
  }

  file {'/usr/lib/systemd/system/plexmediaserver.service':
    ensure  => file,
    content => template('data/plex/plexmediaserver.service.epp'),
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
    content => template('data/deluge/deluge.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  file {'/etc/nginx/sites-available/deluge.conf':
    ensure  => file,
    content => epp('data/nginx/deluge.conf.epp'),
  } ->
  file {'/etc/nginx/sites-enabled/deluge.conf':
    ensure => link,
    source => '/etc/nginx/sites-available/deluge.conf',
    notify => Service['nginx']
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
  # {{{ couchpotato
  file {'/usr/lib/systemd/system/couchpotato.service':
    ensure  => file,
    content => template('data/couchpotato/couchpotato.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  user {'couchpotato':
    ensure => present,
    uid    => '1004',
    gid    => '1004',
  }

  file {'/srv/couchpotato':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file {'/srv/couchpotato/config':
    ensure  => directory,
    owner   => 'couchpotato',
    group   => 'couchpotato',
    mode    => '0775',
    require => File['/srv/couchpotato']
  }

  service {'couchpotato':
    ensure  => running,
    enable  => true,
    require => [ User['couchpotato'], File['/usr/lib/systemd/system/couchpotato.service'], File['/srv/couchpotato/config'] ]
  }
  # }}}

  file {'/usr/lib/systemd/system/sickrage.service':
    ensure  => file,
    content => template('sickrage/sickrage.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }

  file {'/usr/lib/systemd/system/headphones.service':
    ensure  => file,
    content => template('headphones/headphones.service.epp'),
    notify  => Exec['systemctrl daemon-reload'],
  }
}
