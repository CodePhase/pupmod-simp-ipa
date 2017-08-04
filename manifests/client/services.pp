class ipa::client::services {
  # Identify services used by IPA so they are not stopped via ::svckill

  service {'certmonger':
    name        => 'certmonger',
    ensure      => 'running',
  }
}
