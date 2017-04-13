class profile::libvirt_kvm (
    $libvirt_kvm_packages = [],
) {
    package {$libvirt_kvm_packages:
        ensure => latest,
    } ->
    group {'libvirt':
        ensure => present,
    } ->
    service {'libvirtd':
        enable  => true,
    }

    file_line {'qemu uefi config line':
        ensure  => present,
        path    => '/etc/libvirt/qemu.conf',
        line    => 'nvram = ["/usr/share/ovmf/ovmf_code_x64.bin:/usr/share/ovmf/ovmf_vars_x64.bin"]',
        match   => '^nvram\ ?\=\ ?\[[\s\w":/._,]*\]',
        require => Package['libvirt'],
        notify  => Service['libvirtd']
    }

    file {'/etc/polkit-1/rules.d/99-libvirt.rules':
        ensure  => file,
        content => epp('puppet:///data/libvirt/polkit_rules.epp'),
        owner   => 'root',
        group   => 'root',
        mode    => '0400',
    }
}
