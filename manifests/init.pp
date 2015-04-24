# == Class: freebsd_poudriere
#
# Full description of class freebsd_poudriere here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freebsd_poudriere (
  $package_name               = $::freebsd_poudriere::params::package_name,
  $package_ensure             = $::freebsd_poudriere::params::package_ensure,
  $service_name               = $::freebsd_poudriere::params::service_name,
  $service_ensure             = $::freebsd_poudriere::params::service_ensure,
  $service_enable             = $::freebsd_poudriere::params::service_enable,
  $prefix                     = $::freebsd_poudriere::params::prefix,
  $config_params              = $::freebsd_poudriere::params::config_params,
  $config_path                = $::freebsd_poudriere::params::config_path,
  $config_template            = $::freebsd_poudriere::params::config_template,
  $daemon_params              = $::freebsd_poudriere::params::daemon_params,
  $daemon_path                = $::freebsd_poudriere::params::daemon_path,
  $daemon_template            = $::freebsd_poudriere::params::daemon_template,
  $jails                      = $::freebsd_poudriere::params::jails,
  $ports                      = $::freebsd_poudriere::params::ports,
  $bulks                      = $::freebsd_poudriere::params::bulks,
  $bulks_template             = $::freebsd_poudriere::params::bulks_template,
) inherits ::freebsd_poudriere::params {

  # validate parameters here

  class { '::freebsd_poudriere::install': } ->
  class { '::freebsd_poudriere::config': } ~>
  class { '::freebsd_poudriere::service': } ->
  Class['::freebsd_poudriere']
}
