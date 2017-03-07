# hx_apache

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [What hx_apache affects](#what-hx_apache-affects)
    * [Beginning with hx_apache](#beginning-with-hx_apache)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Description

This module preconfigures the [Apache HTTP Web Server](https://httpd.apache.org/) using [puppetlabs-apache](https://forge.puppet.com/puppetlabs/apache) so the server runs both HTTP and HTTPS, supports proxying and uses a secure set of SSL ciphers and protocols.

## Setup

### What hx_apache affects

* This module uses the [puppetlabs-apache](https://forge.puppet.com/puppetlabs/apache)-module, so it will automatically purge all (Apache) configuration files not managed by Puppet.

### Beginning with hx_apache

The most simple configuration is:

```
class {'hx_apache': }
```

## Usage

### Default configuration

The module itself will automatically set the following parameters:

* Enable both HTTP (port 80) and HTTPS (port 443).
* Enable the proxy modules `mod_proxy`, `mod_proxy_http` (HTTP) and `mod_proxy_connect` (HTTPS).
* Deny access to any `.git` directory in the _DocumentRoot_s of all configured websites.

### Options

By changing the parameters to `hx_apache`, you can influence the following settings:

* `ssl_cipher`: provide a list of ciphers the server will support. The server will chose one from the list starting at the leftmost cipher. Separate ciphers with a colon (`:`).

* `ssl_protocol`: provide an array of supported protocols. Uses the same syntax as the Apache configuration file (e.g. `-SSLv2` is supported).

* `default_mods`: list of modules that will be loaded by default. See the [puppetlabs-apache documentation](https://forge.puppet.com/puppetlabs/apache#default_mods) for the correct syntax.

## Reference

### Class hx_apache
The base class.

#### Parameters

* `ssl_cipher`: string of supported SSL ciphers. Uses the same syntax as the Apache configuration file. Default value is `CDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA`.

* `ssl_protocol`: array of supported SSL protocols. Uses the same syntax as the Apache configuration file. Default value is `['all', '-SSLv2', '-SSLv3']`.

* `default_mods`: array of modules that are loaded by default. Uses [puppetlabs-apache syntax](https://forge.puppet.com/puppetlabs/apache#default_mods). By default set to `['auth_basic', 'setenvif', 'headers', 'env', 'authz_user', 'alias', 'autoindex', 'mime', 'rewrite', 'authn_file', 'negotiation', 'access_compat', 'deflate', 'authn_core', 'dir']`.

* `server_admin`: configure the _ServerAdmin_ setting. Set to `hostname@domain` by default (e.g. `s1@example.org`).

## Limitations

This module was tested on Ubuntu 14.04, but should work with all Ubuntu versions. Only works for Apache >= 2.4. RedHat-based systems are also supported.

## Development

Pull requests welcome at [https://github.com/pieterdp/hx_apache](https://github.com/pieterdp/hx_apache).
