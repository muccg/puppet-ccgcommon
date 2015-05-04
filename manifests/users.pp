#
class ccgcommon::users (
  $users           = undef,
  $groups          = undef,
  $authorized_keys = undef,
){
  if defined ('groups') {
    create_resources(group, $groups)
  }

  if defined ('users') {
    create_resources(user, $users)
  }

  if defined ('authorized_keys') {
    create_resources(ssh_authorized_key, $authorized_keys)
  }
}
