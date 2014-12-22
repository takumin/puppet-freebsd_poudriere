# == Class freebsd_poudriere::params
#
# This class is meant to be called from freebsd_poudriere.
# It sets variables according to platform.
#
class freebsd_poudriere::params {
  case $::osfamily {
    'FreeBSD': {
      $package_name               = 'ports-mgmt/poudriere'
      $package_ensure             = present
      $service_name               = 'poudriered'
      $service_ensure             = absent
      $prefix                     = '/usr/local'
      $config                     = "$prefix/etc/poudriere.conf"
      $config_template            = 'poudriere/poudriere.conf.erb'

      # jail
      $jails                      = {}

      # ports
      $ports                      = {}

      # poudriere configuration
      $NO_ZFS                     = undef
      $ZPOOL                      = undef
      $ZROOTFS                    = undef # default: /poudriere
      $FREEBSD_HOST               = undef # default: ftp://ftp.freebsd.org
      $RESOLV_CONF                = '/etc/resolv.conf'
      $BASEFS                     = "$prefix/poudriere"
      $POUDRIERE_DATA             = undef # default: ${BASEFS}/data
      $USE_PORTLINT               = undef
      $MFSSIZE                    = undef
      $USE_TMPFS                  = undef
      $TMPFS_LIMIT                = undef
      $MAX_MEMORY                 = undef
      $DISTFILES_CACHE            = undef
      $CSUP_HOST                  = undef
      $SVN_HOST                   = undef
      $CHECK_CHANGED_OPTIONS      = undef
      $CHECK_CHANGED_DEPS         = undef
      $PKG_REPO_SIGNING_KEY       = undef
      $CCACHE_DIR                 = undef
      $PARALLEL_JOBS              = undef
      $PREPARE_PARALLEL_JOBS      = undef
      $SAVE_WRKDIR                = undef
      $WRKDIR_ARCHIVE_FORMAT      = undef
      $NOLINUX                    = undef
      $NO_FORCE_PACKAGE           = undef
      $NO_PACKAGE_BUILDING        = undef
      $HTTP_PROXY                 = undef
      $HTTPS_PROXY                = undef
      $FTP_PROXY                  = undef
      $NO_RESTRICTED              = undef
      $ALLOW_MAKE_JOBS            = undef
      $ALLOW_MAKE_JOBS_PACKAGES   = undef
      $TIMESTAMP_LOGS             = undef
      $URL_BASE                   = undef
      $MAX_EXECUTION_TIME         = undef
      $NOHANG_TIME                = undef
      $ATOMIC_PACKAGE_REPOSITORY  = undef
      $COMMIT_PACKAGES_ON_FAILURE = undef
      $KEEP_OLD_PACKAGES          = undef
      $KEEP_OLD_PACKAGES_COUNT    = undef
      $PORTTESTING_FATAL          = undef
      $BUILDER_HOSTNAME           = undef
      $PRESERVE_TIMESTAMP         = undef
      $BUILD_AS_NON_ROOT          = undef
      $PRIORITY_BOOST             = undef
      $BUILDNAME_FORMAT           = undef
      $DURATION_FORMAT            = undef
      $USE_COLORS                 = undef
      $TRIM_ORPHANED_BUILD_DEPS   = undef
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
