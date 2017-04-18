class profile::desktop (
    $desktop_packages = [],
)
{
    package { $desktop_packages: ensure => latest }

    service { 'lightdm':
        enable  => true,
        require => Package['lightdm']
    }
}
