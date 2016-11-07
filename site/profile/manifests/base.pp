class profile::base {
  class {'::ntp': }

  package { 'fish':
    ensure => 'present'
  }

  user { 'alan':
    ensure         => present,
    gid            => 'alan',
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
}
