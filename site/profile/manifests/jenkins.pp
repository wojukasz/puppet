class profile::jenkins {
    package {'jenkins':
        ensure => latest,
    }
}
