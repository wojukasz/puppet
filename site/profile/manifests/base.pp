class profile::base {
  class {'::ntp': }
  include sudo
  include sudo::configs

  sudo::conf { 'admins':
      priority => 10,
      content  => "%admins ALL=(ALL) NOPASSWD: ALL",
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

  ssh_authorized_key { 'alan':
    ensure => present,
    user   => 'alan',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD1fmreGnjXSxAEQ2YU7YuaHHGvgDdjVWRVZiXHNnQShHjOrCkPHEiMJcxoaUrFsqMT7IRjtQFPO6jy7ciKidpHMNIgDiZWa1mIHbCQ4biMV6dQMMT36oPIyiunlOn+cblH5nBC2SzJYgCixAJ+HIC5rMrikhUxfeSD6yfQ2GKmlLviNYkVphdUzl4IOQgmQRrRe/nQ9FANppbDVF1KbcpH6UFg6N65+tADAGvtkrqTsbD+jB712rEKxB7IhOmoQDdkO84lx/4HATv0JP7qOLWMErzX6E9pY6a1TCaaxzpgJ+V6McLVkdNnQ3D7erX2ymGwjlmYJ5s7p0UdVun3PDCB'
  }

  ssh_authorized_key { 'alan':
    ensure => present,
    user   => 'alan',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCquJEwzACyWvC63fUgnDafubWu0slqDAuIXfXLec0XNmeqOFtqI0H2r/0S534WJ4d+SJTHo1Cy2IO5nkZuRVjT6TjtK3YZsF8ApeidYHogh8qvD6dposscrBpaMR3Ga2hAXvuBveEGYSPWfG2/T13lPSeVku0zwQl1NkQhIYl86QSjSNgUj1miCeA+46rrLs+QFYSM2fdUcF+CxUFu5F0oTVzliELlzw4wrJ1I5nyd/NxOmOocceun+nJmPejMfg3WXMq03YZb4A227HJfYbtPAkl/mRYO5wSqdJKYGDjAGq4qJZbL+3lHAFz/Jzk6g+2Dy/JWAZqpblZFvrZ9lPtaWk2w7C8sPmmmOiM2msZnBhVGZdnCH+FwXPqItUvcSi2CNx6Awi0c5PSFfuFhnJ3MBp7ixJfHxtuWsAbo3DSQA+F005z8ULcUARQRgZ0vmwtgFcnUjpD3/Sl4f+37TXcCM4j0uJvaYZI5BRpF7XuxFQ7R0EsRJKIBXsG0+cZFYJj+aLfrl4vo6yQgHFM49JKJ9twU2HzQXm0c0VZE7wzqyVodtx7f5TTWpvG0PshbKGWsivz3BJNC5BZU7NKOY/Ni+oBpSfz19YJOUorPle66/VYMYFXeVN7Nmaej0VRE6J89U0mAzQRXms1aDCjHktPqDz/an9OlOMdnAtLRuwea2w=='
  }

  package {['tmux',
           'htop',
           'rsync',
           'ranger',
           'ncdu',
           'aws-cli'
          ]:
    ensure => present,
  }
}
