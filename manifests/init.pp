#
class ccgcommon (
  $timezone=$ccgcommon::params::timezone
) inherits ccgcommon::params {

  include stdlib
  include repo
  include repo::update

  class { 'timezone':
    timezone => $timezone,
  }
}
