#
class ccgcommon::wgetrc (
  $http_proxy = undef,
  $https_proxy = $http_proxy,
  ) {

  file { "/etc/wgetrc":
    content => "http_proxy=${http_proxy}\nhttps_proxy=${https_proxy}\n",
  }
}
