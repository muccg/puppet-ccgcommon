#
class ccgcommon () {
  include stdlib
  include repo
  include repo::update

  class { 'timezone':
    timezone => 'Australia/Perth',
  }
}
