define aur_key_trust(
)
{
  user { 'packager':
    ensure => present,
    home   => "/home/packager",
    system => true,
  } ->
  file { '/home/packager':
    ensure => directory,
    owner  => 'packager',
    mode   => '0700',
  } ->
  exec { "/usr/bin/gpg --recv-keys $title":
    unless => "/usr/bin/gpg --list-keys | /usr/bin/grep \"$title\"",
    user   => 'packager'
  } ->
  exec { "/usr/bin/gpg --lsign-keys $title":
    user   => 'packager'
  }
}

