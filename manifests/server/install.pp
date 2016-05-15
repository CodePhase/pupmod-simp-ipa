class ipa::server::install {
  package { $ipa::package_name_server:
    ensure 		=> $ipa::package_ensure_server,
    name 		=> $ipa::package_name_server,
  }
  package { 'ipa-openldap':
    name		=> 'openldap-servers',
    ensure		=> purged,
    notify		=> Service['portreserve'],
  }
  service { 'ipa':
    ensure              => 'running',
  }

  Package['ipa-openldap'] -> Package[$ipa::package_name_server] -> Exec['ipa-server-install'] -> Service['ipa']
}
