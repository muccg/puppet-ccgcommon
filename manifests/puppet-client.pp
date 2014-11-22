#
class ccgcommon::puppet-client (
  $puppet_master = undef,
  $environment   = undef,
  $templatedir   = '/etc/puppet/environments/$environment/templates',
  $agent         = true,
  $runmode       = 'service',
  ) {

  # templatedir and environment are not explicity passed through
  # but they are used in the puppet.conf template

  class { '::puppet':
    agent         => $agent,
    runmode       => $runmode,
    puppetmaster  => $puppet_master,
  }
}
