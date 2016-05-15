class ipa::server::configure {
  exec { 'ipa-server-install':
    onlyif		=> ["test $(nslookup ${ipa::ipa_servername} | grep -c NXDOMAIN) -eq 0", "test $(ipactl status 2>&1 | grep -c 'IPA is not configured') -eq 1"],
    command 		=> "ipa-server-install -a ${ipa::ipa_admin_pass} --hostname=${ipa::ipa_servername} -r ${ipa::ipa_kerberos_realm} -p ${ipa::ipa_dir_mgr_pass} -n ${ipa::ipa_dns_domain_name} --no-ntp -U",
    timeout		=> 1800,
    path 		=> '/usr/sbin/:/usr/local/sbin/:/usr/bin/:/usr/local/bin/:/bin/:/sbin/',
  }
  iptables::add_rules { 'ipa_tcp':
    content => '-A LOCAL-INPUT -m state --state NEW -m tcp -p tcp -m multiport --dports 80,88,389,443,464 -j ACCEPT'
  }
  iptables::add_rules { 'ipa_udp':
    content => '-A LOCAL-INPUT -m state --state NEW -m udp -p udp -m multiport --dports 88,123,464 -j ACCEPT'
  }
}
