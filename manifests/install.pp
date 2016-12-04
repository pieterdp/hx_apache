##
# Installation (real installation is done by puppetlabs-apache,
# so this doesn't do much)
class hx_apache::install() inherits hx_apache {

    file {'/var/www':
        ensure => present,
    }
}