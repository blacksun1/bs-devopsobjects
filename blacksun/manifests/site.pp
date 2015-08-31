#
#  Call Modules and Classes based on up to 4 roles
#
#
node default {
  Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
  }
  # check if roles defined in node hostname hiera file.
  $hiera_role1 = hiera('role::role_name1','')
  if $hiera_role1 != '' {
    notify {"*** Found heira role::role_name1 value ${hiera_role1} ignoring all facter role values ***": }
    $role_name1 = hiera('role::role_name1','')
    $role_name2 = hiera('role::role_name2','')
    $role_name3 = hiera('role::role_name3','')
    $role_name4 = hiera('role::role_name4','')
    $role_manifest1 = hiera('role::role_manifest1','')
    $role_manifest2 = hiera('role::role_manifest2','')
    $role_manifest3 = hiera('role::role_manifest3','')
    $role_manifest4 = hiera('role::role_manifest4','')
  }
  #class { 'role': }
  # Or to do Direct Module Prefix
  class { 'role' : prefix => 'bs' }
  # Or to maintain compatibility with previous version that used a dash
  #class { 'role' : prefix => 'mycompany', separator => '-'  }
}