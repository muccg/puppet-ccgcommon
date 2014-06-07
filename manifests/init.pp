#
class ccgcommon (
  $timezone=$ccgcommon::params::timezone
) inherits ccgcommon::params {

  include stdlib
  include repo
  include repo::update
  include ccgcommon::sudoers

  class { 'timezone':
    timezone => $timezone,
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
}
