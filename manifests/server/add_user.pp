define ipa::server::add_user (
  $username = $title,
  $firstname,
  $lastname,
  $password,
) {

  exec { "add_${username}":
    command => "kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && echo changeme123 | ipa user-add ${username} --first=${firstname} --last=${lastname} --password; kdestroy -A -q",
    onlyif => ["kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && test $(ipa user-find ${username} | grep \'Number of entries returned\' | cut -d\' \' -f5) -eq 0","kdestroy -A -q"],
    path => '/bin/:/usr/bin/',
    user => 'root',
    require => Class['ipa::server'],
    notify => Exec["passwdchg_${username}"],
  } ->

  exec { "passwdchg_${username}":
    command => "kdestroy -A -q && echo -e 'changeme123\\n${password}\\n${password}' | kinit ${username}; kdestroy -A -q",
    onlyif => ["kdestroy -A -q && echo ${ipa::ipa_admin_pass} | kinit admin && test $(ipa user-find ${username} | grep \'Number of entries returned\' | cut -d\' \' -f5) -eq 1","kdestroy -A -q"],
    path => '/bin/:/usr/bin/',
    user => 'root',
    refreshonly => true,
  }

}
