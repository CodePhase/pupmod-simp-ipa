define ipa::server::add_sudorule (
  $sudorule = $title,
  $sudocmd,
  $host = 'all',
  $user,
) {

  exec { "add_${sudorule}":
    command => "kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && ipa sudorule-add ${sudorule} --hostcat=${host} && ipa sudorule-add-option ${sudorule} --sudooption '!authenticate' && ipa sudocmd-add --desc '${sudorule}' '${sudocmd}' &&  ipa sudorule-add-allow-command ${sudorule} --sudocmds ${sudocmd}; kdestroy -A -q",
  onlyif => ["kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && test $(ipa sudorule-find ${sudorule} | grep \'Number of entries returned\' | cut -d\' \' -f5) -eq 0"],
    require  => Class['ipa::server'],
  } ->

  exec { "addsudoers_${sudorule}":
    command => "kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && ipa sudorule-add-user ${sudorule} --user ${user}",
    onlyif => ["kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && test $(ipa sudorule-show ${sudorule} | grep -c \"$(echo ${user} | sed \'s/,/\\\|/g\')\") -eq 0"],
    require => Class['ipa::server'],  
  }
}

