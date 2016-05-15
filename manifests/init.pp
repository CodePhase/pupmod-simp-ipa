class ipa (
  $package_ensure_client	= $ipa::params::package_ensure_client,
  $package_name_client		= $ipa::params::package_name_client,
  $package_ensure_server	= $ipa::params::package_ensure_server,
  $package_name_server		= $ipa::params::package_name_server,
  $service_manage		= $ipa::params::service_manage,
  $service_enable		= $ipa::params::service_enable, 
  $service_ensure		= $ipa::params::service_ensure,
  $service_name_client		= $ipa::params::service_name_client,
  $service_name_server		= $ipa::params::service_name_server,
  $ipa_admin_pass		= $ipa::params::ipa_admin_pass,
  $ipa_dir_mgr_pass		= $ipa::params::ipa_dir_mgr_pass,
  $ipa_servername		= $ipa::params::ipa_servername,
  $ipa_kerberos_realm		= $ipa::params::ipa_kerberos_realm,
  $ipa_dns_domain_name		= $ipa::params::ipa_dns_domain_name,
  $ipa_client_prpl		= $ipa::params::ipa_client_prpl,
  $ipa_client_prpl_pass		= $ipa::params::ipa_client_prpl_pass,
  $ipa_ntp_server		= $ipa::params::ipa_ntp_server,
) inherits ipa::params {
  
}
