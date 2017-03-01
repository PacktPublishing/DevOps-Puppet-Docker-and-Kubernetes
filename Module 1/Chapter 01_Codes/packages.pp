
$apache = $::osfamily ? {
  'Debian' => 'apache2',
  'RedHat' => 'httpd'
} 
$packages = ['mod_ssl','mod_python'] << $apache
package {$packages: ensure => installed}
