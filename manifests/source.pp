#
class ccgcommon::source {
  include ccgcommon::params

  package { $ccgcommon::params::source_packages:
    ensure => installed
  }
}
