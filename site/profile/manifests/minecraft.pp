class profile::minecraft {
    class {'docker':
        version => 'latest',
        docker_users => ['alan'],
    } ->
    user { 'minecraft':
        ensure => present,
        system => true,
    } ->
    file { '/srv/minecraft/':
        ensure => directory,
        owner => 'minecraft',
        group => 'minecraft',
        mode => '0775',
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
    file { '/srv/minecraft/config/':
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
    }->
    file {'/usr/lib/systemd/system/direwolf20.service':
        ensure => file,
        owner => 'root',
        group => 'root',
        source => "https://raw.githubusercontent.com/demon012/docker-minecraft-direwolf20/master/direwolf20.service",
    } ->
    service { 'direwolf20':
        ensure => running,
        enable  => true,
        hasrestart => false,
        hasstatus => false,
    }
}
