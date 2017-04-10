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
}
