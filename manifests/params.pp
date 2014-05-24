#
class ccgcommon::params {

  $timezone = 'Australia/Perth'

  case $::operatingsystem {

    'CentOS': {
      $source_packages = ['gcc', 'gcc-c++', 'make', 'autoconf', 'yum-utils', 'rpm-build', 'createrepo', 'redhat-rpm-config']
    }

    'Debian', 'Ubuntu': {
      $source_packages = ['build-essential', 'dpkg-dev', 'debhelper']
    }

    default: {
      fail("${module_name} not supported for ${::operatingsystem}")
    }
  }
}
