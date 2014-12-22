# == Class freebsd_poudriere::service
#
# This class is meant to be called from freebsd_poudriere.
# It ensure the service is running.
#
class freebsd_poudriere::service {

  service { $::freebsd_poudriere::service_name:
    ensure     => $::freebsd_poudriere::service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
