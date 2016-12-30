class profile::base {
  class {'::ntp': }
  include sudo
  include sudo::configs

  sudo::conf { 'admins':
      priority => 10,
      content  => "%admins ALL=(ALL) ALL",
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
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCquJEwzACyWvC63fUgnDafubWu0slqDAuIXfXLec0XNmeqOFtqI0H2r/0S534WJ4d+SJTHo1Cy2IO5nkZuRVjT6TjtK3YZsF8ApeidYHogh8qvD6dposscrBpaMR3Ga2hAXvuBveEGYSPWfG2/T13lPSeVku0zwQl1NkQhIYl86QSjSNgUj1miCeA+46rrLs+QFYSM2fdUcF+CxUFu5F0oTVzliELlzw4wrJ1I5nyd/NxOmOocceun+nJmPejMfg3WXMq03YZb4A227HJfYbtPAkl/mRYO5wSqdJKYGDjAGq4qJZbL+3lHAFz/Jzk6g+2Dy/JWAZqpblZFvrZ9lPtaWk2w7C8sPmmmOiM2msZnBhVGZdnCH+FwXPqItUvcSi2CNx6Awi0c5PSFfuFhnJ3MBp7ixJfHxtuWsAbo3DSQA+F005z8ULcUARQRgZ0vmwtgFcnUjpD3/Sl4f+37TXcCM4j0uJvaYZI5BRpF7XuxFQ7R0EsRJKIBXsG0+cZFYJj+aLfrl4vo6yQgHFM49JKJ9twU2HzQXm0c0VZE7wzqyVodtx7f5TTWpvG0PshbKGWsivz3BJNC5BZU7NKOY/Ni+oBpSfz19YJOUorPle66/VYMYFXeVN7Nmaej0VRE6J89U0mAzQRXms1aDCjHktPqDz/an9OlOMdnAtLRuwea2w=='
  }

  ssh_authorized_key { 'alan@work':
    ensure => present,
    user   => 'alan',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAABJQAAAgEAoKKdY6X3upHYYAgfRhaMczF2pATYhU5vOfihjH0R+Ywica/zqdEREkJoJzqHkGzfYNQkcpLMrrcJwpSRZGJguDjpaAJU5brvmTef1TM8+Uup5K6hcden4L7cGiiL84NH+sAhzgpW92MXQaP5JwXUfrLsYBZ9siy1UHTgotVCorT6htwHV8JH/GOQb7pEmNVlZO52ptFrmZMoSgTdne4YH/Mi+vQzqDzfLzIeKD5IzXVFI5kxZBKd1OjhsRSqD+rE7Zwy6RwTeq0AjS7hJbvc243t6PlpzItNXl62dmbhKKhjDzfvLvFm0DvpRry6asQysrTlFHiwN9R1/pI+7/eUYtJ8uovZeyvNu12T3fpNTryqqyJgUUmH+GFhb85iANFJVBo1j3vEDzrvM2K5DK8Le+pqtxAbXgToJJpAmepohAN/+QGex6ZiuKAYK6zk6oZmU8vISbe8eWKrifu/neCm/pWZATCfsXp4RDmh+zIZ0eHwffB3wdOBDG5p4Tc0KWs4UqesaAhVDP2MmvS1/u7vbjCNTsd9M9msNX2REvSDAXShUQjtPPWNkrxDF5AAinxP9uSYXGu2wqBoxwWDFK5spooh7d5Uy9mdFXBZj91fbl0TZWn2U2vP7LEHAdQhgnEUAQS8kyQbsJARatMZCRiBB3UO0pncte4n2dBo0awqQqc='
  }

  file { '/etc/pacman.conf':
      ensure => file,
      content => template('arch/pacman.conf.epp'),
      notify => Exec['pacman-Sy'],
  }

  exec {'pacman-Sy':
      command => '/usr/bin/pacman -Sy',
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
        "set main/server puppet.alan-jenkins.com",
        "set main/environment production",
        "set main/runinterval 1h",
        "set main/strict_variables true"
      ],
  }
}
