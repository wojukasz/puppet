class profile::mdns {
  if $facts['os']['family'] == 'linux' {
    package { 'avahi':
      ensure => latest,
    } ->
    service {'avahi-daemon':
      ensure => running,
      enable => true,
    } ->
    file {'/etc/nsswitch.conf':
      ensure  => file,
      content => @("NSSWITCH")
      # Begin /etc/nsswitch.conf

      passwd: compat mymachines systemd
      group: compat mymachines systemd
      shadow: compat

      publickey: files

      hosts: files mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns myhostname
      networks: files

      protocols: files
      services: files
      ethers: files
      rpc: files

      netgroup: files

      # End /etc/nsswitch.conf
      | NSSWITCH
    }
  }
  elsif $facts['os']['family'] == 'windows' {
    include stdlib
    include chocolatey

    Package { provider => chocolatey, }

    package {'bonjour':
      ensure => latest,
    }
  }
}

