# == Define freebsd_poudriere::bulks
#
# This define is called from freebsd_poudriere for bulk list create.
#
define freebsd_poudriere::bulks (
  $ensure     = present,
) {
  if $ensure == present {
    file { "$::freebsd_poudriere::prefix/etc/poudriere.d/bulk/$name":
      ensure  => file,
      owner   => 'root',
      group   => 'wheel',
      mode    => 0444,
      content => template($::freebsd_poudriere::bulks_template),
      require => [
        File["$::freebsd_poudriere::prefix/etc/poudriere.d/bulk"],
      ],
    }
  }
}
