class ipa::server inherits ipa {
  include ipa::server::install, ipa::server::configure, ipa::server::files, ipa::server::services
}
