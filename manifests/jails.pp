# == Define freebsd_poudriere::jails
#
# This define is called from freebsd_poudriere for jail create.
#
define freebsd_poudriere::jails (
  $ensure = present,
  $version,
  $architecture,
  $method,
  $filesystem,
  $mountpoint,
  $portstree,
  $patch,
  $update,
  $set,
) {
  if $ensure == present {
    exec { "poudriere jail: ${name}":
      command => "poudriere jail -c -j ${name} -v ${version} -a ${architecture} -m ${method} -f ${filesystem} -M ${mountpoint} -p ${portstree} -P ${patch} -t ${update} -z ${set}",
      path    => [
        '/usr/local/bin',
        '/usr/bin',
      ],
      require => [
        File[$freebsd_poudriere::config],
        freebsd_poudriere::ports[$portstree],
      ],
      timeout => 3600,
      unless  => "poudriere jail -qln | grep -qw '^${name}$'",
    }
  }
}
