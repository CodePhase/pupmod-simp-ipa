class ipa::client::configure {
  exec { 'ipa-client-install':
    command 		=> "ipa-client-install --domain=${ipa::ipa_dns_domain_name} --server=${ipa::ipa_servername} --realm=${ipa::ipa_kerberos_realm} --principal ${ipa::ipa_client_prpl} --password=${ipa::ipa_client_prpl_pass} --mkhomedir --ntp-server=${ipa::ipa_ntp_server} --enable-dns-updates --unattended --force",
    refreshonly		=> true,
    timeout		=> 1800,
    path 		=> '/usr/sbin/:/usr/local/sbin/:/usr/bin/:/usr/local/bin/:/bin/',
  }
}
