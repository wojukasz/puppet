class profile::archrepo {
    package {'nginx':
        ensure => latest,
    }

    service {'nginx':
        ensure => running,
        enable => true,
        require => Package['nginx'],
    }

    file { '/etc/nginx/nginx.conf':
        ensure => file,
        content => template('archrepo/nginx.conf.epp'),
        require => Package['nginx'],
        notify => Service['nginx'],
    }
}

