# == Class: opcachegui
#
# This class installs the opcachegui package along with the necessary configuration.
#
# === Examples
#
#   class { 'opcachegui': }
#
# === Requirements
#
class opcachegui () {

  exec { 'exec mkdir -p /usr/share/php/opcachegui/source':
    command => "mkdir -p /usr/share/php/opcachegui/source",
    creates => "/usr/share/php/opcachegui/source",
  }

  exec { 'php-download-opcachegui':
    cwd     => "/tmp",
    command => "git clone https://github.com/alehkot/OpCacheGUI.git opcachegui",
    creates => "/usr/share/php/opcachegui/source/index.php",
  }

  exec { 'php-move-opcachegui':
    command => "cp -r /tmp/opcachegui/* /usr/share/php/opcachegui/source",
    creates => "/usr/share/php/opcachegui/source/index.php",
    require => [ Exec["php-download-opcachegui"], Exec["exec mkdir -p /usr/share/php/opcachegui/source"] ],
  }
}
