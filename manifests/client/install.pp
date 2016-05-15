class ipa::client::install {
  package { $ipa::package_name_client:
    ensure 		=> $ipa::package_ensure_client,
    name 		=> $ipa::package_name_client,
    notify		=> Exec['ipa-client-install'],
  }
}
