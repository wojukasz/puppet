define aurpkg (
  $user = undef
) {
  # {{{ Install cower
  exec { '/usr/bin/curl https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz -o /tmp/cower.tar.gz':
    unless => '/usr/bin/pacman -Qi cower'
  } ->
  exec { '/usr/bin/tar xvf /tmp/cower.tar.gz':
    cwd    => '/tmp/',
    onlyif => '/usr/bin/ls /tmp/cower.tar.gz',
    unless => '/usr/bin/pacman -Qi cower'
  } ->
  file { '/tmp/cower':
    ensure  => directory,
    owner   => $user,
    mode    => '0777',
    require => Exec['/usr/bin/tar xvf /tmp/cower.tar.gz']
  } ->
  exec { 'makepkg cower':
    command => '/usr/bin/makepkg --skippgpcheck',
    cwd  => '/tmp/cower',
    user => $user,
    unless => '/usr/bin/pacman -Qi cower'
  } ->
  exec { '/usr/bin/pacman --noconfirm -U cower*.pkg.tar.xz':
    cwd      => '/tmp/cower',
    unless => '/usr/bin/pacman -Qi cower',
    provider  => shell,
  } ->
  exec { '/usr/bin/rm -Rf /tmp/cower':
    onlyif => '/usr/bin/ls /tmp/cower'
  }
  # }}}
  # {{{ Install pacaur
  package { 'expac':
    ensure => latest,
  } ->
  exec { '/usr/bin/curl https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz -o /tmp/pacaur.tar.gz':
    unless => '/usr/bin/pacman -Qi pacaur'
  } ->
  exec { '/usr/bin/tar xvf /tmp/pacaur.tar.gz':
    cwd    => '/tmp/',
    onlyif => '/usr/bin/ls /tmp/pacaur.tar.gz',
    unless => '/usr/bin/pacman -Qi pacaur'
  } ->
  file { '/tmp/pacaur':
    ensure  => directory,
    owner   => $user,
    mode    => '0777',
    require => Exec['/usr/bin/tar xvf /tmp/pacaur.tar.gz']
  } ->
  exec { 'makepkg pacaur':
    command => '/usr/bin/makepkg',
    cwd     => '/tmp/pacaur',
    user    => $user,
    unless  => '/usr/bin/pacman -Qi pacaur'
  } ->
  exec { '/usr/bin/pacman --noconfirm -U pacaur*.pkg.tar.xz':
    cwd      => '/tmp/pacaur',
    unless   => '/usr/bin/pacman -Qi pacaur',
    provider => shell,
  } ->
  exec { '/usr/bin/rm -Rf /tmp/pacaur':
    onlyif => '/usr/bin/ls /tmp/pacaur'
  }
  # }}}
  # {{{ if package not installed
  exec { "/usr/bin/pacaur --noconfirm --noedit -S $title":
    cwd         => "/home/$user",
    provider    => shell,
    environment => [
      'HOME=/home/alan',
    ],
    user        => $user,
  }
  # }}}
  # {{{ if package already installed
  ## Get current installed version
  ## Get latest version
  # exec {"/usr/bin/curl https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=$title":
  # }

  ## If latest version newer than installed version


  # }}}
}
