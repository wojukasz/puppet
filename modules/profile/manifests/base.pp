class profile::base {
  if $facts['os']['family'] == 'linux' {
    class {'::ntp': }
    include sudo
    include sudo::configs

    sudo::conf { 'admins':
        priority => 10,
        content  => '%admins ALL=(ALL) ALL',
    }

    package { 'fish':
      ensure => 'present'
    }

    group { 'admins':
      ensure => 'present',
    }

    user { 'alan':
      ensure         => present,
      groups         => [ 'admins' ],
      home           => '/home/alan',
      managehome     => true,
      purge_ssh_keys => true,
    }

    ssh_authorized_key { 'alan@main':
      ensure => present,
      user   => 'alan',
      type   => 'ssh-rsa',
      key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD1fmreGnjXSxAEQ2YU7YuaHHGvgDdjVWRVZiXHNnQShHjOrCkPHEiMJcxoaUrFsqMT7IRjtQFPO6jy7ciKidpHMNIgDiZWa1mIHbCQ4biMV6dQMMT36oPIyiunlOn+cblH5nBC2SzJYgCixAJ+HIC5rMrikhUxfeSD6yfQ2GKmlLviNYkVphdUzl4IOQgmQRrRe/nQ9FANppbDVF1KbcpH6UFg6N65+tADAGvtkrqTsbD+jB712rEKxB7IhOmoQDdkO84lx/4HATv0JP7qOLWMErzX6E9pY6a1TCaaxzpgJ+V6McLVkdNnQ3D7erX2ymGwjlmYJ5s7p0UdVun3PDCB'
    }

    ssh_authorized_key { 'alan@mobile':
      ensure => present,
      user   => 'alan',
      type   => 'ssh-rsa',
      key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC59zQ+PHIwFrrqupgKl/lQOCXGAbPOgnWWt1dP7Y3v3Si+l+3PI8Ie+HjerZvXrIx2t/6w4lZQxY7WuRk2nZ2F0mbhhqZsIf1Y042FLinCV6Z+ea3g/g+F3tYB0pHHdK49lUKFqpJKas3gxdFWXBuSPjFh+Mmbq/ipVNexl82MyScdUWj/sZSgxQ+TIxLIImwx0XIZOX5YtMJX+li4NeXyiNVAlnb8Km6mkIFXs/wVmU3k1+2jXVy+mdc/fJ6QT+WAsVQuBbX6qizf0A82csmT2hEwo58ynca6DN5CB69NREi3WhbTyzz422P/M5DLOvsIV5GbflFd4edjPN7w1wUx0gkwaldr/aNhgeKrr4m1NvLhZFvNDSRTvCxYHxQ9jCoPxL1l48SEiUh7HUwUkwV79fp2kq3cRozMJ5goLPDFxfJud6Ypqi9FFEaTcClWp9Vh2nDN+o3c/LIKRLzI1/0XpLLeco4oT9HJh0ajPedU1Aldoe9cEBkfoyL04+1X77brZM3WXe5NZCoztbhnIuUI87wE/N1lPkHr2nDtxgsesTyrZFhcG/EarrnGS7stOtroHrmfnFU2hHRWzqYNg5nnCPACGOArok7Z4PsusCZ/gWMxThx9Kw2L7XZV5tjn7At3re+EbJSv/TnYtfHJEigQTOJ32zobYB19xYCpOaSaaw=='
    }

    ssh_authorized_key { 'alan@work':
      ensure => present,
      user   => 'alan',
      type   => 'ssh-rsa',
      key    => 'AAAAB3NzaC1yc2EAAAABJQAAAgEAoKKdY6X3upHYYAgfRhaMczF2pATYhU5vOfihjH0R+Ywica/zqdEREkJoJzqHkGzfYNQkcpLMrrcJwpSRZGJguDjpaAJU5brvmTef1TM8+Uup5K6hcden4L7cGiiL84NH+sAhzgpW92MXQaP5JwXUfrLsYBZ9siy1UHTgotVCorT6htwHV8JH/GOQb7pEmNVlZO52ptFrmZMoSgTdne4YH/Mi+vQzqDzfLzIeKD5IzXVFI5kxZBKd1OjhsRSqD+rE7Zwy6RwTeq0AjS7hJbvc243t6PlpzItNXl62dmbhKKhjDzfvLvFm0DvpRry6asQysrTlFHiwN9R1/pI+7/eUYtJ8uovZeyvNu12T3fpNTryqqyJgUUmH+GFhb85iANFJVBo1j3vEDzrvM2K5DK8Le+pqtxAbXgToJJpAmepohAN/+QGex6ZiuKAYK6zk6oZmU8vISbe8eWKrifu/neCm/pWZATCfsXp4RDmh+zIZ0eHwffB3wdOBDG5p4Tc0KWs4UqesaAhVDP2MmvS1/u7vbjCNTsd9M9msNX2REvSDAXShUQjtPPWNkrxDF5AAinxP9uSYXGu2wqBoxwWDFK5spooh7d5Uy9mdFXBZj91fbl0TZWn2U2vP7LEHAdQhgnEUAQS8kyQbsJARatMZCRiBB3UO0pncte4n2dBo0awqQqc='
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
    } ->
    augeas { 'puppetconfig':
        context => '/files/etc/puppetlabs/puppet/puppet.conf',
        changes => [
          'set main/server puppet.alan-jenkins.com',
          'set main/environment production',
          'set main/runinterval 1h',
          'set main/strict_variables true'
        ],
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
  }
}
