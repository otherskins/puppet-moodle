class moodle::install {

  contain moodle::config

  package { $moodle::dependencies:
    ensure => $moodle::ensure,
  }

  file { '/var/www/modledata':
    ensure => 'directory',
    mode   => '0777',
    owner  => 'root',
    group  => 'root',
  }
}
