class profile::alandesktop {
    $desktop_packages = [
        'google-chrome',
        'xorg-server',
        'i3-vm',
        'lightdm',
        'lightdm-gtk-greeter',
        'i3status',
        'dmenu',
        'termite',
        'firefox',
        'virtualbox',
        'compton',
        'feh',
        'evince',
        'libreoffice',
        'inkscape',
        'gimp',
        'i3lock',
        'shutter',
        'gnome-web-photo',
        'wireshark',
        'xdot'
    ]
    package { $desktop_packages: ensure => latest }
}
