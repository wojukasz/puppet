class profile::gnome_desktop (
  $packages = [
    'gnome',
    'gnome-tweak-tool',
    'gnome-weather'
    'virtualbox-guest-utils',
    'virtualbox-guest-dkms'
  ]
) {
  package {$packages:
    ensure => latest,
  }
}
