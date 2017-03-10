class profile::wingaming {
  include chocolatey

  Package { provider => chocolatey, }

  package {'steam':
    ensure => latest,
  }
  package {'retroarch':
    ensure => latest,
  }
  package {'gamesavemanager':
    ensure => latest,
  }
}
