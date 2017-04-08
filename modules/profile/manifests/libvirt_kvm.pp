class profile::libvirt_kvm (
    $libvirt_kvm_packages = [],
) {
    package {$libvirt_kvm_packages:
        ensure => latest,
    }
}
