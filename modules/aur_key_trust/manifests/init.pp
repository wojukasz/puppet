define aur_key_trust(
  $user = undef
)
{
  exec { "/usr/bin/gpg --recv-keys $title":
    unless => "/usr/bin/gpg --list-keys | /usr/bin/grep \"$title\"",
    user   => $user
  } ->
  exec { "/usr/bin/gpg --lsign-keys $title":
    user   => $user
  }
}

