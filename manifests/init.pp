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
  $config                     = $::freebsd_poudriere::params::config,
  $config_template            = $::freebsd_poudriere::params::config_template,
  $jails                      = $::freebsd_poudriere::params::jails,
  $ports                      = $::freebsd_poudriere::params::ports,
  $NO_ZFS                     = $::freebsd_poudriere::params::NO_ZFS,
  $ZPOOL                      = $::freebsd_poudriere::params::ZPOOL,
  $ZROOTFS                    = $::freebsd_poudriere::params::ZROOTFS,
  $FREEBSD_HOST               = $::freebsd_poudriere::params::FREEBSD_HOST,
  $RESOLV_CONF                = $::freebsd_poudriere::params::RESOLV_CONF,
  $BASEFS                     = $::freebsd_poudriere::params::BASEFS,
  $POUDRIERE_DATA             = $::freebsd_poudriere::params::POUDRIERE_DATA,
  $USE_PORTLINT               = $::freebsd_poudriere::params::USE_PORTLINT,
  $MFSSIZE                    = $::freebsd_poudriere::params::MFSSIZE,
  $USE_TMPFS                  = $::freebsd_poudriere::params::USE_TMPFS,
  $TMPFS_LIMIT                = $::freebsd_poudriere::params::TMPFS_LIMIT,
  $MAX_MEMORY                 = $::freebsd_poudriere::params::MAX_MEMORY,
  $DISTFILES_CACHE            = $::freebsd_poudriere::params::DISTFILES_CACHE,
  $CSUP_HOST                  = $::freebsd_poudriere::params::CSUP_HOST,
  $SVN_HOST                   = $::freebsd_poudriere::params::SVN_HOST,
  $CHECK_CHANGED_OPTIONS      = $::freebsd_poudriere::params::CHECK_CHANGED_OPTIONS,
  $CHECK_CHANGED_DEPS         = $::freebsd_poudriere::params::CHECK_CHANGED_DEPS,
  $PKG_REPO_SIGNING_KEY       = $::freebsd_poudriere::params::PKG_REPO_SIGNING_KEY,
  $CCACHE_DIR                 = $::freebsd_poudriere::params::CCACHE_DIR,
  $PARALLEL_JOBS              = $::freebsd_poudriere::params::PARALLEL_JOBS,
  $PREPARE_PARALLEL_JOBS      = $::freebsd_poudriere::params::PREPARE_PARALLEL_JOBS,
  $SAVE_WRKDIR                = $::freebsd_poudriere::params::SAVE_WRKDIR,
  $WRKDIR_ARCHIVE_FORMAT      = $::freebsd_poudriere::params::WRKDIR_ARCHIVE_FORMAT,
  $NOLINUX                    = $::freebsd_poudriere::params::NOLINUX,
  $NO_FORCE_PACKAGE           = $::freebsd_poudriere::params::NO_FORCE_PACKAGE,
  $NO_PACKAGE_BUILDING        = $::freebsd_poudriere::params::NO_PACKAGE_BUILDING,
  $HTTP_PROXY                 = $::freebsd_poudriere::params::HTTP_PROXY,
  $HTTPS_PROXY                = $::freebsd_poudriere::params::HTTPS_PROXY,
  $FTP_PROXY                  = $::freebsd_poudriere::params::FTP_PROXY,
  $NO_RESTRICTED              = $::freebsd_poudriere::params::NO_RESTRICTED,
  $ALLOW_MAKE_JOBS            = $::freebsd_poudriere::params::ALLOW_MAKE_JOBS,
  $ALLOW_MAKE_JOBS_PACKAGES   = $::freebsd_poudriere::params::ALLOW_MAKE_JOBS_PACKAGES,
  $TIMESTAMP_LOGS             = $::freebsd_poudriere::params::TIMESTAMP_LOGS,
  $URL_BASE                   = $::freebsd_poudriere::params::URL_BASE,
  $MAX_EXECUTION_TIME         = $::freebsd_poudriere::params::MAX_EXECUTION_TIME,
  $NOHANG_TIME                = $::freebsd_poudriere::params::NOHANG_TIME,
  $ATOMIC_PACKAGE_REPOSITORY  = $::freebsd_poudriere::params::ATOMIC_PACKAGE_REPOSITORY,
  $COMMIT_PACKAGES_ON_FAILURE = $::freebsd_poudriere::params::COMMIT_PACKAGES_ON_FAILURE,
  $KEEP_OLD_PACKAGES          = $::freebsd_poudriere::params::KEEP_OLD_PACKAGES,
  $KEEP_OLD_PACKAGES_COUNT    = $::freebsd_poudriere::params::KEEP_OLD_PACKAGES_COUNT,
  $PORTTESTING_FATAL          = $::freebsd_poudriere::params::PORTTESTING_FATAL,
  $BUILDER_HOSTNAME           = $::freebsd_poudriere::params::BUILDER_HOSTNAME,
  $PRESERVE_TIMESTAMP         = $::freebsd_poudriere::params::PRESERVE_TIMESTAMP,
  $BUILD_AS_NON_ROOT          = $::freebsd_poudriere::params::BUILD_AS_NON_ROOT,
  $PRIORITY_BOOST             = $::freebsd_poudriere::params::PRIORITY_BOOST,
  $BUILDNAME_FORMAT           = $::freebsd_poudriere::params::BUILDNAME_FORMAT,
  $DURATION_FORMAT            = $::freebsd_poudriere::params::DURATION_FORMAT,
  $USE_COLORS                 = $::freebsd_poudriere::params::USE_COLORS,
  $TRIM_ORPHANED_BUILD_DEPS   = $::freebsd_poudriere::params::TRIM_ORPHANED_BUILD_DEPS,
) inherits ::freebsd_poudriere::params {

  # validate parameters here

  class { '::freebsd_poudriere::install': } ->
  class { '::freebsd_poudriere::config': } ~>
  class { '::freebsd_poudriere::service': } ->
  Class['::freebsd_poudriere']
}
