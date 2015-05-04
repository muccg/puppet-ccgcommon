#
class ccgcommon::hostname {
  include stdlib
  if $custom_hostname {
    class { 'ccgcommon::hostname::setup':
      stage    => 'setup',
      hostname => $custom_hostname,
    }
  }
}


class ccgcommon::hostname::setup ($hostname) {
  file { '/etc/hostname':
    content => $hostname,
  }

  exec { 'set hostname':
    command     => '/bin/hostname `/bin/cat /etc/hostname`',
    refreshonly => true,
    subscribe   => File['/etc/hostname'],
    require     => File['/etc/hostname'],
  }
}
