##
# Install the latest version of php and configure it for Apache
class hx_apache::config::php() inherits hx_apache {

    if $::os['name'] == 'Debian' {

        $packages = ['php5', 'php5-curl', 'php5-mysql', 'libapache2-mod-php5']

    } elsif $::os['name'] == 'Ubuntu' {

        $maj_version = $::os['release']['full'].scanf('%2i')

        if $maj_version < 16 {
            # PHP 7 became the default in Ubuntu 16.04
            $packages = ['php5', 'php5-curl', 'php5-mysql', 'libapache2-mod-php5']
        } else {
            $packages = ['php', 'php-curl', 'php-mysql', 'libapache2-mod-php']
        }

    } elsif $::os['family'] == 'RedHat' {
        $packages = ['php', 'php-mysql']

    } else {
        fail('Installing php is only supported on Debian/Ubuntu and RedHat-based systems.')
    }

    each ($packages) | $package | {
        package { $package:
            ensure => installed
        }
    }

    if $::os['name'] == 'Ubuntu' and $maj_version < 16 {
        # PHP 7 became the default in Ubuntu 16.04
        include apache::mod::php
        apache::mod {'php7':
            lib => 'libphp7.0.so',
        }
    } else {
        include apache::mod::php
    }
}