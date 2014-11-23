#
class ccgcommon::puppet-client (
  $puppet_master = undef,
  $environment   = undef,
  $templatedir   = '/etc/puppet/environments/$environment/templates',
  $agent         = true,
  $runmode       = 'service',
  ) {

  # environment is not explicity passed through
  # but is used in the puppet.conf template
  #
  # TODO: templatedir is not being respected just yet

  class { '::puppet':
    agent         => $agent,
    runmode       => $runmode,
    puppetmaster  => $puppet_master,
  }
}


class ccgcommon::puppet-client::sydney (
  $runmode       = 'service',
  ) {
  class { 'ccgcommon::puppet-client':
    puppet_master => 'ccg-syd-puppet-master.ec2.ccgapps.com.au',
    environment   => $puppet_environment,
    runmode       => $runmode,
  }
}
