# == Define freebsd_poudriere::ports
#
# This define is called from freebsd_poudriere for ports create.
#
define freebsd_poudriere::ports (
  $ensure     = present,
  $filesystem = undef,
  $mountpoint = undef,
  $method     = undef,
  $branch     = undef,
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
      if $filesystem {
        $_filesystem = "-f ${filesystem}"
      }
      if $mountpoint {
        $_mountpoint = "-M ${mountpoint}"
      }
      if $method {
        $_method = "-m ${method}"
      }
      if $branch {
        $_branch = "-B ${branch}"
      }

      $args = "-c -p ${name} ${_filesystem} ${_mountpoint} ${_method} ${_branch}"
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
