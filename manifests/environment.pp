#
class ccgcommon::environment (
  $path = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  $http_proxy = undef,
  $https_proxy = $http_proxy,
  ) {

  file { '/etc/environment':
    content => template('ccgcommon/environment.erb')
  }
}


class ccgcommon::environment::sydney {
  class { 'ccgcommon::environment': }
}
