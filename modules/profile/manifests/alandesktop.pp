class profile::alandesktop (
    $desktop_packages = [],
)
{
    package { $desktop_packages: ensure => latest }
}
