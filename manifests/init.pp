#
class ccgcommon (
  $timezone=$ccgcommon::params::timezone,
  $rsyslog_tcp=false,
  $rsyslog_udp=false,
) inherits ccgcommon::params {

  include stdlib
  include repo
  include repo::update
  include ccgcommon::sudoers

  class { 'rsyslog::server':
    enable_tcp => $rsyslog_tcp,
    enable_udp => $rsyslog_udp,
  }

  class { 'timezone':
    timezone => $timezone,
    notify   => Class['rsyslog::service'],
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
