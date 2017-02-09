class profile::vmwareguest {
    $vmware_packages = [
      'open-vm-tools',
      'xf86-input-vmmouse'
    ]

    service {'vmtoolsd':
      ensure => running,
      enable => true,
    }

    package { $vmware_packages: ensure => latest }
}
