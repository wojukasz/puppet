class base::downloader {
    package { 'deluge':
        ensure => latest,
    }
}
