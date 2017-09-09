##
# Configuration using puppetlabs-apache. This
# also ensures the web server is installed.
class hx_apache::config () inherits hx_apache {

    class {'apache':
        purge_vhost_dir  => true,
        default_vhost    => false,
        default_mods     => $hx_apache::default_mods,
        serveradmin      => $hx_apache::server_admin,
        server_signature => false,
        mpm_module       => 'prefork',
    }

    ##
    # Support for HTTP and HTTPS
    apache::listen {'80': }
    apache::listen {'443': }

    ##
    # We frequently use apache as a front-end for applications
    # running on non-standard  ports. So enable mod_proxy,
    # proxy_connect (for SSL) & mod_proxy_http
    class {'apache::mod::proxy': }
    class {'apache::mod::proxy_http': }
    apache::mod {'proxy_connect': }

    ##
    # Secure SSL configuration (based on https://ssllabs.com)
    class {'apache::mod::ssl':
        ssl_cipher           => $hx_apache::ssl_cipher,
        ssl_honorcipherorder => true,
        ssl_protocol         => $hx_apache::ssl_protocol,
        ssl_compression      => false,
    }

    ##
    # Some applications contain a .git directory.
    # This directory frequently contains
    # sensitive information. We deny access to it.
    apache::custom_config {'git':
        content => '<Directory ~ "\.git">
        Require all denied
</Directory>',
    }

    ##
    # Enable php if $enable_php is true
    if $hx_apache::enable_php == true {
        include hx_apache::config::php
    }

}
