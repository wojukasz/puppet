class profile::gnome_desktop (
  $packages = undef
) {
  package {$packages:
    ensure => latest,
  }
}
