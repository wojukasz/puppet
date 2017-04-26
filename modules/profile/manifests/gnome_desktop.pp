class profile::gnome_desktop (
  $packages = [
    'gnome',
    'gnome-tweak-tool',
    'gnome-weather'
  ]
) {
  package {$packages:
    ensure => latest,
  }
}
