#
class ccgcommon::docker (
  $manage_package              = false,
  $use_upstream_package_source = false,
  $manage_kernel               = false,
  $extra_parameters            = [ '-g /docker', '--dns 8.8.8.8', '--dns 8.8.4.4', ]
) {

  class { '::docker':
    extra_parameters            => $extra_parameters,
    manage_package              => $manage_package,
    manage_kernel               => $manage_kernel,
    use_upstream_package_source => $use_upstream_package_source,
  }

}

class ccgcommon::dockerimages {

  docker::image { 'muccg/squid-deb-proxy':
    image     => 'muccg/squid-deb-proxy',
    image_tag => 'latest'
  }

  docker::image { 'gliderlabs/logspout':
    image     => 'gliderlabs/logspout',
    image_tag => 'latest'
  }

  docker::image { 'muccg/logstash':
    image     => 'muccg/logstash',
    image_tag => 'latest'
  }

  docker::image { 'muccg/kibana':
    image     => 'muccg/kibana',
    image_tag => 'latest'
  }

  docker::image { 'muccg/elasticsearch':
    image     => 'muccg/elasticsearch',
    image_tag => 'latest'
  }

  # old base
  docker::image { 'muccg/base-ubuntu14.04':
    image     => 'muccg/base',
    image_tag => 'ubuntu14.04'
  }

  docker::image { 'muccg/ubuntu14.04-base':
    image     => 'muccg/ubuntu14.04-base',
    image_tag => 'latest'
  }

  # old base
  docker::image { 'muccg/base-centos6':
    image     => 'muccg/base',
    image_tag => 'centos6'
  }

  docker::image { 'muccg/centos6-base':
    image     => 'muccg/centos6-base',
    image_tag => 'latest'
  }

  # old base
  docker::image { 'muccg/base-debian8':
    image     => 'muccg/base',
    image_tag => 'debian8'
  }

  docker::image { 'muccg/debian8-base':
    image     => 'muccg/debian8-base',
    image_tag => 'latest'
  }

  docker::image { 'muccg/python-base-ubuntu14.04-2.7':
    image     => 'muccg/python-base',
    image_tag => 'ubuntu14.04-2.7'
  }

  docker::image { 'muccg/python-base-debian8-2.7':
    image     => 'muccg/python-base',
    image_tag => 'debian8-2.7'
  }

  docker::image { 'muccg/python-base-centos6-2.7':
    image     => 'muccg/python-base',
    image_tag => 'centos6-2.7'
  }

  docker::image { 'postgres-9.3':
    image     => 'postgres',
    image_tag => '9.3'
  }

  docker::image { 'postgres-9.4':
    image     => 'postgres',
    image_tag => '9.4'
  }
}
