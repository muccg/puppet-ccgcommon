#
class ccgcommon::environment (
  $path = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  $http_proxy = undef,
  $https_proxy = $http_proxy,
  ) {

  file { '/etc/environment':
    content => template('environment.erb')
  }
}


class ccgcommon::sydney-environment {
  class { 'ccgcommon::environment':
    http_proxy => 'http://ccg-syd-nginx-staging.ec2.ccgapps.com.au:3128',
  }
}
