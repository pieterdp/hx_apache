##
# Default options for the Apache web server
class hx_apache (
    $ssl_cipher = $hx_apache::params::ssl_cipher,
    $ssl_protocol = $hx_apache::params::ssl_protocol,
    $default_mods = $hx_apache::params::default_mods,
    $server_admin = $hx_apache::params::server_admin,
    $enable_php = $hx_apache::params::enable_php
) inherits hx_apache::params {

    include hx_apache::install
    include hx_apache::config
}