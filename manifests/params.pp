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
      $config_path                = "$prefix/etc/poudriere.conf"
      $config_template            = 'freebsd_poudriere/poudriere.conf.erb'
      $daemon_options             = {}
      $daemon_config_path         = "$prefix/etc/poudriered.conf"
      $daemon_config_template     = 'freebsd_poudriere/poudriered.conf.erb'
      $jails                      = {}
      $ports                      = {}
      $bulks                      = {}
      $bulks_template             = 'freebsd_poudriere/bulks.erb'

      # Global Configuration
      $options = {
        'ZPOOL'                      => undef,
        'NO_ZFS'                     => undef,
        'ZROOTFS'                    => undef, # Default: /poudriere
        'FREEBSD_HOST'               => 'http://ftp.freebsd.org',
        'RESOLV_CONF'                => '/etc/resolv.conf',
        'BASEFS'                     => "$prefix/poudriere",
        'POUDRIERE_DATA'             => undef, # Default: ${BASEFS}/data
        'USE_PORTLINT'               => undef,
        'MFSSIZE'                    => undef,
        'USE_TMPFS'                  => undef,
        'TMPFS_LIMIT'                => undef, # Default: none
        'MAX_MEMORY'                 => undef, # Default: none
        'DISTFILES_CACHE'            => undef,
        'CSUP_HOST'                  => undef,
        'SVN_HOST'                   => undef, # Default: svn0.us-west.FreeBSD.org
        'CHECK_CHANGED_OPTIONS'      => undef,
        'CHECK_CHANGED_DEPS'         => undef,
        'PKG_REPO_SIGNING_KEY'       => undef,
        'CCACHE_DIR'                 => undef,
        'PARALLEL_JOBS'              => undef,
        'PREPARE_PARALLEL_JOBS'      => undef,
        'SAVE_WRKDIR'                => undef,
        'WRKDIR_ARCHIVE_FORMAT'      => undef, # Default: tbz
        'NOLINUX'                    => undef,
        'NO_FORCE_PACKAGE'           => undef,
        'NO_PACKAGE_BUILDING'        => undef,
        'NO_RESTRICTED'              => undef,
        'ALLOW_MAKE_JOBS'            => undef,
        'ALLOW_MAKE_JOBS_PACKAGES'   => undef,
        'TIMESTAMP_LOGS'             => undef, # Default: no
        'URL_BASE'                   => undef,
        'MAX_EXECUTION_TIME'         => undef, # Default: 86400
        'NOHANG_TIME'                => undef, # Default: 7200
        'ATOMIC_PACKAGE_REPOSITORY'  => undef, # Default: yes
        'COMMIT_PACKAGES_ON_FAILURE' => undef, # Default: yes
        'KEEP_OLD_PACKAGES'          => undef, # Default: no
        'KEEP_OLD_PACKAGES_COUNT'    => undef, # Default: 5
        'PORTTESTING_FATAL'          => undef, # Default: yes
        'BUILDER_HOSTNAME'           => undef,
        'PRESERVE_TIMESTAMP'         => undef,
        'BUILD_AS_NON_ROOT'          => undef, # Default: no
        'PRIORITY_BOOST'             => undef, # Default: none
        'BUILDNAME_FORMAT'           => undef, # Default: %Y-%m-%d_%Hh%Mm%Ss
        'DURATION_FORMAT'            => undef, # Default: %H:%M:%S
        'USE_COLORS'                 => undef, # Default: yes
        'TRIM_ORPHANED_BUILD_DEPS'   => undef, # Default: yes
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
