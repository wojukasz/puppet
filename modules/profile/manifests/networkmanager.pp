class profile::networkmanager {
  package { 'networkmanager':
    ensure => installed,
  } ->
  service { 'NetworkManager':
    enable    => true,
  }
}
