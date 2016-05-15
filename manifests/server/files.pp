class ipa::server::files {
  # Identify files used by IPA so they are not removed via ::apache

  file {'ipa_pki':
    path	=> '/etc/httpd/conf/pki'
  }
  file {'ipa_private':
    path	=> '/etc/httpd/conf/pki/private'
  }
  file {'ipa_public':
    path	=> '/etc/httpd/conf/pki/public'
  }
  file {'/etc/httpd/conf/pki/cacerts':
    ignore	=> "*"
  }
  file {'ipa_conf_nss':
    path	=> '/etc/httpd/conf.d/nss.conf'
  }
  file {'ipa_conf_wsgi':
    path	=> '/etc/httpd/conf.d/wsgi.conf'
  }
  file {'ipa_conf_kerb':
    path	=> '/etc/httpd/conf.d/auth_kerb.conf'
  }
  file {'ipa_conf_ipa':
    path	=> '/etc/httpd/conf.d/ipa.conf'
  }
  file {'ipa_conf_ipa_proxy':
    path	=> '/etc/httpd/conf.d/ipa-pki-proxy.conf'
  }
  file {'ipa_conf_ipa_rewrite':
    path	=> '/etc/httpd/conf.d/ipa-rewrite.conf'
  }
  file {'ipa_priv_host':
    path	=> '/etc/httpd/conf/pki/private/${fqdn}.pem'
  }
  file {'ipa_conf_password':
    path	=> '/etc/httpd/conf/password.conf'
  }
  file {'ipa_keytab':
    path	=> '/etc/httpd/conf/ipa.keytab'
  }
  file {'ipa_pub_host':
    path	=> '/etc/httpd/conf/pki/public/${fqdn}.pub'
  }
  file {'ipa_sync':
    path	=> '/etc/httpd/conf/pki/cacerts/.sync_updated'
  }
}
