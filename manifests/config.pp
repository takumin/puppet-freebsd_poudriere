# == Class freebsd_poudriere::config
#
# This class is called from freebsd_poudriere for service config.
#
class freebsd_poudriere::config {

  file { $freebsd_poudriere::config:
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0444,
    content => template($freebsd_poudriere::config_template),
  }

  file { "$freebsd_poudriere::prefix/etc/poudriere.d":
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0755,
  }

  #
  # pkgng bulk create
  #
  file { "$freebsd_poudriere::prefix/etc/poudriere.d/bulk":
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0755,
    require => File["$freebsd_poudriere::prefix/etc/poudriere.d"],
  }

  #
  # rsync ssh key create
  #
  file { "$freebsd_poudriere::prefix/etc/poudriere.d/ssh":
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0700,
    require => File["$freebsd_poudriere::prefix/etc/poudriere.d"],
  }
  exec { 'poudriere_ssh':
    command => "ssh-keygen -t rsa -P \"\" -C \"poudriere@$::domain\" -f ssh/id_rsa",
    creates => [
      "$freebsd_poudriere::prefix/etc/poudriere.d/ssh/id_rsa",
      "$freebsd_poudriere::prefix/etc/poudriere.d/ssh/id_rsa.pub",
    ],
    cwd     => "$freebsd_poudriere::prefix/etc/poudriere.d",
    path    => [ '/usr/local/bin', '/usr/bin' ],
    require => File["$freebsd_poudriere::prefix/etc/poudriere.d/ssh"],
  }

  #
  # pkgng key file create
  #
  file { "$freebsd_poudriere::prefix/etc/poudriere.d/keys":
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0700,
    require => File["$freebsd_poudriere::prefix/etc/poudriere.d"],
  }
  exec { 'poudriere_keys':
    command => 'openssl genrsa -out keys/pkg.key 4096',
    creates => "$freebsd_poudriere::prefix/etc/poudriere.d/keys/pkg.key",
    cwd     => "$freebsd_poudriere::prefix/etc/poudriere.d",
    path    => [ '/usr/local/bin', '/usr/bin' ],
    require => [
      File["$freebsd_poudriere::prefix/etc/poudriere.d/keys"],
    ],
  }

  #
  # pkgng cert file create
  #
  file { "$freebsd_poudriere::prefix/etc/poudriere.d/certs":
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0755,
    require => File["$freebsd_poudriere::prefix/etc/poudriere.d"],
  }
  exec { 'poudriere_certs':
    command => 'openssl rsa -in keys/pkg.key -pubout > certs/pkg.crt',
    creates => "$freebsd_poudriere::prefix/etc/poudriere.d/certs/pkg.crt",
    cwd     => "$freebsd_poudriere::prefix/etc/poudriere.d",
    path    => [ '/usr/local/bin', '/usr/bin' ],
    require => [
      File["$freebsd_poudriere::prefix/etc/poudriere.d/certs"],
      Exec['poudriere_keys'],
    ],
  }

  #
  # ports tree create
  #
  create_resources(freebsd_poudriere::ports, $freebsd_poudriere::ports)

  #
  # jails create
  #
  create_resources(freebsd_poudriere::jails, $freebsd_poudriere::jails)

}
