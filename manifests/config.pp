class moodle::config {

  $dirname = 'moodle'
  $filename = 'moodle-latest-33.zip'
  $install_path = "/var/www/html/${dirname}"

  file { $install_path:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }

  archive { $filename:
    path         => "/tmp/${filename}",
    source       => 'https://download.moodle.org/download.php/direct/stable33/moodle-latest-33.zip',
    extract      => true,
    extract_path => '/var/www/html',
    cleanup      => true,
    user         => 'root',
    group        => 'root',
    require      => File[$install_path],
  }

}
