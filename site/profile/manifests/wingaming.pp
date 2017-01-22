class profile::wingaming {
  include chocolatey

  Package { provider => chocolatey, }

  package {'gamesavemanager':
    ensure => latest,
  }
}
