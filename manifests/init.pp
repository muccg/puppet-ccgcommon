#
class ccgcommon (
  $timezone=$ccgcommon::params::timezone,
) inherits ccgcommon::params {

  include stdlib
  include ccgcommon::sudoers
  include ccgcommon::hostname

  class { 'timezone':
    timezone => $timezone,
  }

  class { 'fail2ban':
    jails_config   => 'file',
    jails_template => 'fail2ban/jail.local.erb',
    jails          => ['ssh', ],
    require        => Class['timezone'],
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
