class profile::base (
  $users = {},
)
{
  if $facts['os']['family'] == 'linux' {
    class {'::ntp': }
    users { $users: }
    include sudo
    include sudo::configs

    sudo::conf { 'wheel':
        priority => 10,
        content  => '%wheel ALL=(ALL) ALL',
    }

    package { 'fish':
      ensure => 'present'
    }

    file { '/etc/pacman.conf':
        ensure  => file,
        content => template('data/arch/pacman.conf.epp'),
        notify  => Exec['pacman-Sy'],
    }

    exec {'pacman-Sy':
        command     => '/usr/bin/pacman -Sy',
        refreshonly => true,
    }

    package {[
      'augeas',
      'ruby-augeas',
      'aws-cli',
      'htop',
      'ncdu',
      'ranger',
      'rsync',
      'tmux'
    ]:
      ensure => present,
    }
  }
  elsif $facts['os']['family'] == 'windows' {
    include stdlib
    include chocolatey

    $puppetconfig = @(EOT)
    [main]
    server=puppet.alan-jenkins.com
    autoflush=true
    environment=production
    | EOT

    file {'C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf':
      ensure  => file,
      content => $puppetconfig
    }

    Package { provider => chocolatey, }

    package {'googlechrome':
      ensure => latest,
    }
    package {'filezilla':
      ensure => latest,
    }
    package {'gimp':
      ensure => latest,
    }
    package {'inkscape':
      ensure => latest,
    }
    package {'libreoffice':
      ensure => latest,
    }
    package {'7zip':
      ensure => latest,
    }
    package {'vim':
      ensure => latest,
    }
    package {'vagrant':
      ensure => latest,
    }
    package {'virtualbox':
      ensure => latest,
    }
    package {'putty':
      ensure => latest,
    }
    package {'git':
      ensure => latest,
    }
    package {'autohotkey':
      ensure => latest,
    }
    package {'dropbox':
      ensure => latest,
    }
    package {'googledrive':
      ensure => latest,
    }
    package {'sumatrapdf':
      ensure => latest,
    }
    package {'pidgin':
      ensure => latest,
    }
    package {'classic-shell':
      ensure => latest,
    }
    package {'nmap':
      ensure => latest,
    }
    package {'vlc':
      ensure => latest,
    }
    package {'sysinternals':
      ensure => latest,
    }
    package {'javaruntime':
      ensure => latest,
    }
    package {'sourcetree':
      ensure => latest,
    }
  }
}
