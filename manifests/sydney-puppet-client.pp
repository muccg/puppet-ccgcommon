#
class ccgcommon::sydney-puppet-client {
  class { 'ccgcommon::puppet-client':
    puppet_master = 'ccg-syd-puppet-master.ec2.ccgapps.com.au',
    environment   = $puppet_environment,
  }
}

