# == Define freebsd_poudriere::jails
#
# This define is called from freebsd_poudriere for jail create.
#
define freebsd_poudriere::jails (
  $ensure       = present,
  $version      = undef,
  $architecture = undef,
  $method       = undef,
  $filesystem   = undef,
  $mountpoint   = undef,
  $portstree    = undef,
  $patch        = undef,
  $update       = undef,
  $set          = undef,
) {
  if $ensure == present {
    if $version {
      $_version = "-v ${version}"
    }
    if $architecture {
      $_architecture = "-a ${architecture}"
    }
    if $method {
      $_method = "-m ${method} "
    }
    if $filesystem {
      $_filesystem = "-f ${filesystem}"
    }
    if $mountpoint {
      $_mountpoint = "-M ${mountpoint}"
    }
    if $portstree {
      $_portstree = "-p ${portstree}"
    }
    if $patch {
      $_patch = "-P ${patch}"
    }
    if $update {
      $_update = "-t ${update}"
    }
    if $set {
      $_set = "-z ${set}"
    }

    $args = "${_version} ${_architecture} ${_method} ${_filesystem} ${_mountpoint} ${_portstree} ${_patch} ${_update} ${_set}"

    exec { "poudriere jail: ${name}":
      command => "poudriere jail -c -j ${name} ${args}",
      path    => [
        '/usr/local/bin',
        '/usr/bin',
      ],
      require => [
        File[$freebsd_poudriere::config],
      ],
      timeout => 3600,
      unless  => "poudriere jail -qln | grep -qw '^${name}'",
    }

    if $portstree {
      Exec["poudriere jail: ${name}"] {
        require +> [
          freebsd_poudriere::ports[$portstree],
        ],
      }
    }
  }
}
