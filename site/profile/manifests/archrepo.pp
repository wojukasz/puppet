class profile::archrepo {
    package {'nginx':
        ensure => latest,
    }

    service {'nginx':
        ensure => running,
        enable => true,
    }

    /* augeas { 'nginx_config': */

    /* } */
}

