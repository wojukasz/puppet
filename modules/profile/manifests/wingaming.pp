class profile::wingaming {
  include chocolatey

  Package { provider => chocolatey, }

  package {'steam':
    ensure => latest,
  }

  package {'uplay': 
    ensure => latest,
  }

  package {'origin':
    ensure => latest,
  }

  package {'battle.net':
    ensure => latest,
  }

  package {'retroarch':
    ensure => latest,
  }

  package {'gamesavemanager':
    ensure => latest,
  }

  package {'mumble':
    ensure => latest,
  }

  package {'discord':
    ensure => latest,
  }

  package {'teamspeak':
    ensure => latest,
  }
  
  package {'obs-studio':
    ensure => latest,
  }
}
