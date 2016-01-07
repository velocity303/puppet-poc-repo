class poc_apache {
  include apache
  include apache::mod::ssl
  include apache::mod::proxy
  include apache::mod::rewrite
  file { ['/etc/ssl/certs/mycert.crt', '/etc/ssl/certs/ca-bundle.crt', '/etc/ssl/certs/mycert.key']:
    mode => '0600',
  }
  file { '/var/www/reverse':
     ensure  => directory,
     require => Class['apache'],
  }
  Apache::Vhost {
    priority        => '10',
    port            => '443',
    docroot         => '/var/www/reverse',
    ssl             => true,
    ssl_cert        => '/etc/ssl/certs/mycert.crt',
    ssl_chain       => '/etc/ssl/certs/ca-bundle.crt',
    ssl_key         => '/etc/ssl/certs/mycert.key',
    ssl_cipher      => 'EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH+aRSA+RC4:EECDH:EDH+aRSA:!RC4:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS',
    ssl_proxyengine => true,
    custom_fragment => 'SSLProxyVerify none
    SSLProxyCheckPeerCN off
    SSLProxyCheckPeerName off',
    rewrites        => [
      {
        comment      => 'redirect http traffic to https',
        rewrite_cond => ['%{SERVER_PORT} !^443$'],
        rewrite_rule => ['^.*$ https://%{SERVER_NAME}%{REQUEST_URI} [L,R]'],
      },
    ],
    proxy_preserve_host => true,
  }
  apache::vhost { 'myhost.mydomain.com':
    proxy_pass => [
      { 'path' => '/', 'url' => 'https://otherhost.mydomain.int/', 'reverse_urls' => 'https://otherhost.mydomain.int', },
    ],
  }
  apache::vhost { 'tomcathost.mydomain.com':
    proxy_pass => [
      { 'path' => '/', 'url' => 'http://otherhost.mydomain.int:8080/', 'reverse_urls' => 'http://tomcathost.mydomain.int:8080', },
    ],
  }
}
