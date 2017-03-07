##
# Default options for the Apache web server
class hx_apache (
    String $ssl_cipher = $hx_apache::params::ssl_cipher,
    Array $ssl_protocol = $hx_apache::params::ssl_protocol,
    Array $default_mods = $hx_apache::params::default_mods,
    Strin $server_admin = $hx_apache::params::server_admin,
    Boolean $enable_php = $hx_apache::params::enable_php
) inherits hx_apache::params {

    include hx_apache::install
    include hx_apache::config
}