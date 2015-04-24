# == Class freebsd_poudriere::params
#
# This class is meant to be called from freebsd_poudriere.
# It sets variables according to platform.
#
class freebsd_poudriere::params {
  case $::osfamily {
    'FreeBSD': {
      $package_name               = 'ports-mgmt/poudriere'
      $package_ensure             = 'present'
      $service_name               = 'poudriered'
      $service_ensure             = 'stopped'
      $service_enable             = false
      $prefix                     = '/usr/local'
      $config_params              = {}
      $config_path                = "$prefix/etc/poudriere.conf"
      $config_template            = 'freebsd_poudriere/poudriere.conf.erb'
      $jails                      = {}
      $ports                      = {}
      $bulks                      = {}
      $bulks_template             = 'freebsd_poudriere/bulks.erb'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
