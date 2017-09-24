class moodle::install {

  contain ::apache
  contain moodle::configure
  contain moodle::database

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
