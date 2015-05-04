#
class ccgcommon::users (
  $users           = undef,
  $groups          = undef,
  $authorized_keys = undef,
){
  if $groups {
    create_resources(group, $groups)
  }

  if $users {
    create_resources(user, $users)
  }

  if $authorized_keys {
    create_resources(ssh_authorized_key, $authorized_keys)
  }
}
