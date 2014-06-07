#
class ccgcommon::sudoers {
  if ($ssh_user) {
    file {'/etc/sudoers.d/disabletty':
      owner   => 'root',
      group   => 'root',
      content => template('ccgcommon/sudoers.disabletty.erb'),
      mode    => '0440'
    }
  }
}
