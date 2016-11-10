class profile::minecraft {
    class {'docker':
        version => 'latest',
        docker_users => ['alan'],
    }

    user { 'minecraft':
        ensure => present,
        system => true,
    } ->
    file { '/srv/minecraft/world':
        ensure => directory,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/logs':
        ensure => directory,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/config/JourneyMapServer':
        ensure => directory,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/banned-ips.json':
        ensure => file,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/banned-players.json':
        ensure => file,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/ops.json':
        ensure => file,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/usercache.json':
        ensure => file,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/whitelist.json':
        ensure => file,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    } ->
    file { '/srv/minecraft/server.properties':
        ensure => file,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
    }
}
