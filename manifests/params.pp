class ipa::params {
  $package_ensure_client        = 'installed'
  $package_name_client          = 'ipa-client'
  $package_ensure_server        = 'installed'
  $package_name_server          = 'ipa-server'
  $service_manage               = false
  $service_enable               = false
  $service_ensure               = false
  $service_name_client          = 'ipa-client'
  $service_name_server          = 'ipa-server'
  $ipa_admin_pass               = 'ipa1-changeme'
  $ipa_dir_mgr_pass             = 'ipa1-changeme'
  $ipa_servername               = $::servername
  $ipa_kerberos_realm           = inline_template('<%= domain.upcase %>')
  $ipa_dns_domain_name          = $domain
  $ipa_client_prpl		= 'admin'
  $ipa_client_prpl_pass		= $ipa_admin_pass
  $ipa_ntp_server		= $ipa_servername
}
