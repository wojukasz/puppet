class profile::base {
  class {'::ntp': }
  class {'sudo': }

  package { 'fish':
    ensure => 'present'
  }

  group { 'sudo':
    ensure => 'present',
  }

  /* sudo::conf { 'sudo': */
  /*   priority => 10, */
  /*   content  => "%sudo ALL=(ALL)" */
  /* } */

  user { 'alan':
    ensure         => present,
    groups         => [ 'sudo' ],
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

  package {['sudo',
           'tmux',
           'htop',
           'rsync',
           'ranger',
           'ncdu',
           'aws-cli'
          ]:
    ensure => present,
  }

  /* class { 'locales': */
  /*   default_locale => 'en_GB.UTF-8', */
  /*   locales        => ['en_GB.UTF-8 UTF-8'], */
  /*  } */
}
