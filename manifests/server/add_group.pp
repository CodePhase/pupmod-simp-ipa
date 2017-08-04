define ipa::server::add_group (
  $groupname = $title,
  $desc,
  $users = "",
) {

  if $users != "" {
    $grpmems = "--users=${users}"
  }

  exec { "add_${groupname}":
    command => "kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && ipa group-add ${groupname} --desc=\"${desc}\"; kdestroy -A -q",
    onlyif => ["kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && test $(ipa group-find ${groupname} | grep \'Number of entries returned\' | cut -d\' \' -f5) -eq 0","kdestroy -A -q"],
    path => '/bin/:/usr/bin/',
    user => 'root',
    require => Class['ipa::server'],
    notify => Exec["addgrpmem_${groupname}_${users}"],
  }

  exec { "addgrpmem_${groupname}_${users}":
    command => "kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && ipa group-add-member ${groupname} ${grpmems}; kdestroy -A -q",
    onlyif => ["kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && test $(ipa group-find ${groupname} | grep \'Number of entries returned\' | cut -d\' \' -f5) -eq 1","kdestroy -A -q",],
    path => '/bin/:/usr/bin/',
    user => 'root',
    refreshonly => true,
  }

}
