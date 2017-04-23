class profile::i3_desktop (
  $packages = undef
) {
  package {$packages:
    ensure => latest,
  }
}
