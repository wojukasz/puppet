class profile::alandesktop {
    $desktop_packages = [ 'aria2', 'bind-tools', 'chromium', 'compton', 'dmenu', 'docker', 'docker-compose', 'dos2unix', 'evince', 'f2fs-tools', 'feh', 'firefox', 'gimp', 'git', 'gnome-web-photo', 'gnu-netcat', 'google-chrome', 'graphviz', 'gvim', 'i3-wm', 'i3lock', 'i3status', 'inkscape', 'iotop', 'libreoffice', 'lightdm', 'lightdm-gtk-greeter', 'nethogs', 'nmap', 'openssh', 'pkgfile', 'puppet', 'pwgen', 'shutter', 'termite', 'the_silver_searcher', 'tig', 'vagrant', 'virtualbox', 'wget', 'whois', 'wireshark', 'xdot', 'xorg-server' ]
    package { $desktop_packages: ensure => latest }
}
