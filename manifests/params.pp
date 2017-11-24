##
# Apache parameters
class hx_apache::params () {
    $ssl_cipher = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256'
    $ssl_protocol = ['all', '-SSLv2', '-SSLv3', '-TLSv1', '-TLSv1.1']
    $default_mods = [
        'auth_basic',
        'setenvif',
        'headers',
        'env',
        'authz_user',
        'alias',
        'autoindex',
        'mime',
        'rewrite',
        'authn_file',
        'negotiation',
        'access_compat',
        'deflate',
        'authn_core',
        'dir'
    ]
    if $::networking {
        $server_admin = "${::networking['hostname']}@${::networking['domain']}"
    } else {
        $server_admin = "${::hostname}@${::domain}"
    }
    $enable_php = false
}