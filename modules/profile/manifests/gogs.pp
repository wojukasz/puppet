class profile::gogs_server {
    package{'gogs':
        ensure => latest,
        notify => Service['gogs']
    }

    service{'gogs':
        ensure  => running,
        enabled => true,
    }

}

