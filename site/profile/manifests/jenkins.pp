class profile::jenkins {
    package {'jenkins':
        ensure => latest,
    }

    service {'jenkins':
        ensure => running,
        enable => true,
    }

    file { '/home/jenkins':
        ensure => directory,
        owner => 'jenkins',
        group => 'jenkins',
        mode => '0770',
        require => Package['jenkins'],
    } ->
    file { '/home/jenkins/.ssh':
        ensure => directory,
        owner => 'jenkins',
        group => 'jenkins',
        mode => '0770',
    }
}
