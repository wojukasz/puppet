define account (
  Hash $users = {},
) {
  $users.each | String $user_name, Hash $user_hash | {
    # {{{ Default value code
    if has_key($user_hash, 'ensure') {
      $ensure = $user_hash['ensure']
    } else {
      $ensure = present
    }

    if has_key($user_hash, 'group') {
      $group = $user_hash['group']
    } else {
      $group = $user_name
    }

    if has_key($user_hash, 'groups') {
      $groups = $user_hash['groups']
    } else {
      $groups = $user_hash['groups']
    }

    if has_key($user_hash, 'user_home') {
      $user_home = $user_hash['user_home']
    } else {
      $user_home = "/home/$user_name"
    }

    if has_key($user_hash, 'user_home_mode') {
      $user_home_mode = $user_hash['user_home_mode']
    } else {
      $user_home_mode = "0770"
    }

    if has_key($user_hash, 'ssh_keys') {
      $ssh_keys = $user_hash['ssh_keys']
    } else {
      $ssh_keys = {}
    }

    if has_key($user_hash, 'dotfiles_repo') {
      $user_dotfiles_repo = $user_hash['dotfiles_repo']
    } else {
      $user_dotfiles_repo = undef
    }

    if has_key($user_hash, 'dotfiles_path') {
      $user_dotfiles_path = $user_hash['dotfiles_path']
    } else {
      $user_dotfiles_path = undef
    }

    if has_key($user_hash, 'dotfiles_provider') {
      $user_dotfiles_provider = $user_hash['dotfiles_provider']
    } else {
      $user_dotfiles_provider = "git"
    }

    if has_key($user_hash, 'dotfiles_command') {
      $user_dotfiles_command = $user_hash['dotfiles_command']
    } else {
      $user_dotfiles_command = undef
    }

    if has_key($user_hash, 'user_allowdupe') {
      $user_allowdupe = $user_hash['user_allowdupe']
    } else {
      $user_allowdupe = false
    }

    if has_key($user_hash, 'user_attribute_membership') {
      $user_attribute_membership = $user_hash['user_attribute_membership']
    } else {
      $user_attribute_membership = 'minimum'
    }

    if has_key($user_hash, 'user_auths') {
      $user_auths = $user_hash['user_auths']
    } else {
      $user_auths = undef
    }

    if has_key($user_hash, 'user_comment') {
      $user_comment = $user_hash['user_comment']
    } else {
      $user_comment = undef
    }

    if has_key($user_hash, 'user_expiry' ) {
      $user_expiry = $user_hash['user_expiry']
    } else {
      $user_expiry = absent
    }

    if has_key($user_hash, 'user_forcelocal' ) {
      $user_forcelocal = $user_hash['user_forcelocal']
    } else {
      $user_forcelocal = false
    }

    if has_key($user_hash, 'user_gid' ) {
      $user_gid = $user_hash['user_gid']
    } else {
      $user_gid = "$user_name"
    }

    if has_key($user_hash, 'user_groups' ) {
      $user_groups = $user_hash['user_groups']
    } else {
      $user_groups = []
    }

    if has_key($user_hash, 'user_ia_load_module' ) {
      $user_ia_load_module = $user_hash['user_ia_load_module']
    } else {
      $user_ia_load_module = undef
    }

    if has_key($user_hash, 'user_iterations' ) {
      $user_iterations = $user_hash['user_iterations']
    } else {
      $user_iterations = 200000
    }

    if has_key($user_hash, 'user_key_membership' ) {
      $user_key_membership = $user_hash['user_key_membership']
    } else {
      $user_key_membership = "minimum"
    }

    if has_key($user_hash, 'user_keys' ) {
      $user_keys = $user_hash['user_keys']
    } else {
      $user_keys = []
    }

    if has_key($user_hash, 'user_loginclass' ) {
      $user_loginclass = $user_hash['user_loginclass']
    } else {
      $user_loginclass = undef
    }

    if has_key($user_hash, 'user_managehome' ) {
      $user_managehome = $user_hash['user_managehome']
    } else {
      $user_managehome = true
    }

    if has_key($user_hash, 'user_membership' ) {
      $user_membership = $user_hash['user_membership']
    } else {
      $user_membership = "minimum"
    }

    if has_key($user_hash, 'user_password' ) {
      $user_password = $user_hash['user_password']
    } else {
      $user_password = undef
    }

    if has_key($user_hash, 'user_password_max_age' ) {
      $user_password_max_age = $user_hash['user_password_max_age']
    } else {
      $user_password_max_age = undef
    }

    if has_key($user_hash, 'user_password_min_age' ) {
      $user_password_min_age = $user_hash['user_password_min_age']
    } else {
      $user_password_min_age = undef
    }

    if has_key($user_hash, 'user_profile_membership' ) {
      $user_profile_membership = $user_hash['user_profile_membership']
    } else {
      $user_profile_membership = "minimum"
    }

    if has_key($user_hash, 'user_profiles' ) {
      $user_profiles = $user_hash['user_profiles']
    } else {
      $user_profiles = undef
    }

    if has_key($user_hash, 'user_project' ) {
      $user_project = $user_hash['user_project']
    } else {
      $user_project = undef
    }

    if has_key($user_hash, 'user_purge_ssh_keys' ) {
      $user_purge_ssh_keys = $user_hash['user_purge_ssh_keys']
    } else {
      $user_purge_ssh_keys = false
    }

    if has_key($user_hash, 'user_role_membership' ) {
      $user_role_membership = $user_hash['user_role_membership']
    } else {
      $user_role_membership = "minimum"
    }

    if has_key($user_hash, 'user_roles' ) {
      $user_roles = $user_hash['user_roles']
    } else {
      $user_roles = undef
    }

    if has_key($user_hash, 'user_salt' ) {
      $user_salt = $user_hash['user_salt']
    } else {
      $user_salt = undef
    }

    if has_key($user_hash, 'user_attributes') {
      $user_attributes = $user_hash['user_attributes']
    } else {
      $user_attributes = undef
    }

    if has_key($user_hash, 'user_auth_membership') {
      $user_auth_membership = $user_hash['user_auth_membership']
    } else {
      $user_auth_membership = undef
    }

    if has_key($user_hash, 'user_provider') {
      $user_provider = $user_hash['user_provider']
    } else {
      $user_provider = undef
    }

    if has_key($user_hash, 'user_dotfiles_revision') {
      $user_dotfiles_revision = $user_hash['user_dotfiles_revision']
    } else {
      $user_dotfiles_revision = undef
    }

    if has_key($user_hash, 'user_shell' ) {
      $user_shell = $user_hash['user_shell']
    } else {
      $user_shell = "/bin/bash"
    }

    if has_key($user_hash, 'user_system' ) {
      $user_system = $user_hash['user_system']
    } else {
      $user_system = false
    }

    if has_key($user_hash, 'user_uid' ) {
      $user_uid = $user_hash['user_uid']
    } else {
      $user_uid = undef
    }
    # }}}
    # {{{ Create primary group
    group {$group:
      ensure => present,
    }
    # }}}
    # {{{ Create user
    user {$user_name:
      ensure               => $ensure,
      allowdupe            => $user_allowdupe,
      attribute_membership => $user_attribute_membership,
      attributes           => $user_attributes,
      auth_membership      => $user_auth_membership,
      auths                => $user_auths,
      comment              => $user_comment,
      expiry               => $user_expiry,
      forcelocal           => $user_forcelocal,
      gid                  => $user_gid,
      groups               => $user_groups,
      home                 => $user_home,
      ia_load_module       => $user_ia_load_module,
      iterations           => $user_iterations,
      key_membership       => $user_key_membership,
      keys                 => $user_keys,
      loginclass           => $user_loginclass,
      managehome           => false,
      membership           => $user_membership,
      password             => $user_password,
      password_max_age     => $user_password_max_age,
      password_min_age     => $user_password_min_age,
      profile_membership   => $user_profile_membership,
      profiles             => $user_profiles,
      project              => $user_project,
      provider             => $user_provider,
      purge_ssh_keys       => $user_purge_ssh_keys,
      role_membership      => $user_role_membership,
      roles                => $user_roles,
      salt                 => $user_salt,
      shell                => $user_shell,
      system               => $user_system,
      uid                  => $user_uid,
      require              => Group[$group]
    }
    # }}}
    # {{{ Create home code
    if $user_managehome {
      exec {"/usr/bin/mkdir -p $user_home":
        creates => $user_home,
        require => User[$user_name],
      } ->
      file {$user_home:
        ensure  => directory,
        owner   => $user_name,
        group   => $group,
        mode    => $user_home_mode,
        require => [
          User[$user_name],
          Group[$group],
        ]
      }
    }
    # }}}
    # {{{ SSH Key code
    $ssh_keys.each | String $key_name, Hash $key | {
      if has_key($key, 'ensure') {
        $key_ensure = $key['ensure']
      } else {
        $key_ensure = 'present'
      }

      if has_key($key, 'type') {
        $key_type = $key['type']
      } else {
        $key_type = 'ssh-rsa'
      }

      ssh_authorized_key { "$key_name":
        ensure  => $key_ensure,
        user    => $user_name,
        type    => $key_type,
        key     => $key['key'],
        require => [
          User[$user_name],
          Group[$group],
        ]
      }
    }
    # }}}
    # {{{ Dotfiles code
    if $user_dotfiles_repo {
      if $user_dotfiles_command {
        $sudo_user_dotfiles_command = "/usr/bin/sudo -u $user_name $user_dotfiles_command"
        $vcs_notify  = Exec[$sudo_user_dotfiles_command]
      }
      vcsrepo {$user_dotfiles_path:
        ensure   => latest,
        provider => $user_dotfiles_provider,
        source   => $user_dotfiles_repo,
        revision => $user_dotfiles_revision,
        require  => File[$user_home],
        notify   => $vcs_notify,
      }
      if $sudo_user_dotfiles_command {
        exec {$sudo_user_dotfiles_command:
          refreshonly => true,
        }
      }
      # }}}
      }
  }
}
