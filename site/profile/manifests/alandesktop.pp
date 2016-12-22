class profile::alandesktop {
    $desktop_packages = [
        'compton',
        'curl',
        'dmenu',
        'evince',
        'feh',
        'firefox',
        'gimp',
        'gnome-web-photo',
        'google-chrome',
        'i3-vm',
        'i3lock',
        'i3status',
        'inkscape',
        'libreoffice',
        'lightdm',
        'lightdm-gtk-greeter',
        'shutter',
        'termite',
        'virtualbox',
        'wget',
        'wireshark',
        'xdot',
        'xorg-server',
    ]
    package { $desktop_packages: ensure => latest }
}
