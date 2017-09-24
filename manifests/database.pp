# Class to manage moodle mysql
class moodle::database {

  $override_options = {
    'mysqld' => {
    'user' => 'mysql',
    'default_storage_engine' => 'innodb',
    'innodb_file_per_table' => 1,
    'innodb_file_format' => 'Barracuda',
    }
  }

  class { '::mysql::server':
    root_password           => 'moodle',
    remove_default_accounts => true,
    override_options        => $override_options,
  }


  mysql::db { 'moodle':
    user     => 'moodle',
    password => 'moodle',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE'],
  }

}
