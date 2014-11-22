#
class ccgcommon::hostname {
  if $custom_hostname {
    class { 'ccgcommon::hostname::setup':
      stage    => 'setup',
    }
  }
}


class ccgcommon::hostname::setup {
  file { '/etc/hostname':
    content => "$custom_hostname",
  }

  exec { 'set hostname':
    command => '/bin/hostname `/bin/cat /etc/hostname`',
    require => File['/etc/hostname'],
  }
}
