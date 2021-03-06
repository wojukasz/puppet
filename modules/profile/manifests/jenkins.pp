class profile::jenkins (
    $le_account_thumbprint = ""
)
{
    package {'jenkins':
        ensure => latest,
    }

    package {'acmetool':
      ensure => latest,
    }

    service {'jenkins':
        ensure => running,
        enable => true,
    }

    file { '/home/jenkins':
        ensure  => directory,
        owner   => 'jenkins',
        group   => 'jenkins',
        mode    => '0770',
        require => Package['jenkins'],
    } ->
    file { '/home/jenkins/.ssh':
        ensure => directory,
        owner  => 'jenkins',
        group  => 'jenkins',
        mode   => '0770',
    }

    file { '/etc/nginx/sites-available/jenkins.alan-jenkins.com':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
      content => epp('jenkins/jenkins.alan-jenkins.com.epp', { 'le_account_thumbprint' => $le_account_thumbprint })
    }

    file { '/etc/nginx/sites-enabled/jenkins.alan-jenkins.com':
      ensure => link,
      target => '/etc/nginx/sites-available/jenkins.alan-jenkins.com',
      notify => Service['nginx'],
    }

    package { 'go':
        ensure => latest,
    }
}
