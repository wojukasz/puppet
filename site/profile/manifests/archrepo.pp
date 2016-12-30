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

    file { '/etc/nginx/sites-enabled':
        ensure => directory,
    } ->
    file { '/etc/nginx/sites-available':
        ensure => directory,
    } ->
    file { '/etc/nginx/sites-available/arch.repo.alan-jenkins.com.conf':
        ensure => file,
        content => template('archrepo/arch.repo.alan-jenkins.com.conf.epp'),
        require => Package['nginx'],
        notify => Service['nginx'],
    } ->
    file { '/etc/nginx/sites-enabled/arch.repo.alan-jenkins.com.conf':
        ensure => link,
        target => '/etc/nginx/sites-available/arch.repo.alan-jenkins.com.conf',
        require => Package['nginx'],
        notify => Service['nginx'],
    }

    group { 'archrepo':
        ensure => present,
    } ->
    User <| title == "alan" |> {
        groups +> ["archrepo"],
    } ->
    file { '/srv/http/repo/arch':
        ensure => directory,
        owner => 'root',
        group => 'archrepo',
        mode => '0775',
    }
}

