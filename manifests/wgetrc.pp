#
class ccgcommon::wgetrc (
  $http_proxy = undef,
  $https_proxy = $http_proxy,
  ) {

  file { "/etc/wgetrc":
    content => "http_proxy=${http_proxy}\nhttps_proxy=${https_proxy}\n",
  }
}


class ccgcommon::wgetrc::sydney {
  class { 'ccgcommon::wgetrc':
    http_proxy => 'http://ccg-syd-nginx-staging.ec2.ccgapps.com.au:3128',
  }
}
