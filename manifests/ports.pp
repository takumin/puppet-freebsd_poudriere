# == Define freebsd_poudriere::ports
#
# This define is called from freebsd_poudriere for ports create.
#
define freebsd_poudriere::ports (
  $ensure = present,
  $filesystem,
  $mountpoint,
  $method,
  $branch,
  $portshaker = false,
) {
  if $ensure == present {
    if $portshaker == true {
      $args = "-c -p ${name} -F -f none -M ${freebsd_poudriere::BASEFS}/ports/default"

      Exec["poudriere ports: ${name}"] {
        require => [
          freebsd_portshaker::target[$name],
        ],
      }
    } else {
      $args = "-c -p ${name} -f ${filesystem} -M ${mountpoint} -m ${method} -B ${branch}"
    }

    exec { "poudriere ports: ${name}":
      command => "poudriere ports ${args}",
      path    => [
        '/usr/local/bin',
        '/usr/bin',
      ],
      require => [
        File[$freebsd_poudriere::config],
      ],
      unless  => "poudriere ports -qln | grep -qw '^${name}'",
    }
  }
}
