class ipa::server::services {
  # Identify services used by IPA so they are not stopped via ::svckill

  service {'dirsrv':
    name        => 'dirsrv'
  }
  service {'certmonger':
    name        => 'certmonger'
  }
  service {'ipa_memcached':
    name        => 'ipa_memcached'
  }
  service {'kadmin':
    name        => 'kadmin'
  }
  service {'krb5kdc':
    name        => 'krb5kdc'
  }
  service {'pki-cad':
    name        => 'pki-cad'
  }
}

