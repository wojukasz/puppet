class profile::jenkins {
    package {'jenkins':
        ensure => latest,
    }

    service {'jenkins':
        ensure => running,
        enable => true,
    }
}
