#
class ccgcommon (
  $timezone=$ccgcommon::params::timezone,
) inherits ccgcommon::params {

  include stdlib
  include repo
  include repo::update
  include ccgcommon::sudoers

  class { 'timezone':
    timezone => $timezone,
  }

  class { 'fail2ban':
    ignoreip => ['134.115.67.200', '134.115.67.200', '127.0.0.1/8'],
    require  => Class['timezone'],
  }

  exec { '/bin/hostname `cat /etc/ccg_hostname`':
    onlyif => '/usr/bin/stat /etc/ccg_hostname',
  }

  # $ssh_user is a fact injected by ccgplatform
  # under ccgplatform the workflow requires a working dir
  # for $ssh_user
  if ($ssh_user) {
    file {'/usr/local/src':
      ensure => directory,
      owner  => $ssh_user,
      group  => $ssh_user
    }
  }

  # Some puppet modules expect /usr/local/bin to exist
  # puppetlabs/postgresql is one example
  file {'/usr/local/bin':
    ensure => directory,
    owner  => 'root',
    group  => 'root'
  }
}
