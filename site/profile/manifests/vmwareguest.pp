class profile::vmwareguest {
    $vmware_packages = [
      'open-vm-tools',
      'xf86-input-vmmouse'
    ]

    service {'vmtoolsd':
      enable  => true,
      ensure => running
    }

    package { $vmware_packages: ensure => latest }
}
