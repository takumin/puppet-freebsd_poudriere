# == Class freebsd_poudriere::install
#
# This class is called from freebsd_poudriere for install.
#
class freebsd_poudriere::install {

  package { $::freebsd_poudriere::package_name:
    ensure => $::freebsd_poudriere::package_ensure,
  }
}
