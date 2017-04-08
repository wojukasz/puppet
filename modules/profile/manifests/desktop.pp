class profile::desktop (
    $desktop_packages = [],
)
{
    package { $desktop_packages: ensure => latest }
}
