class opcachegui(
  $webroot_location = '/var/www'
) {

  $location = "$webroot_location/opcachegui"

  exec { 'opcachegui-install':
    command => "git clone https://github.com/PeeHaa/OpCacheGUI.git ${location}",
    creates => "$location",
    onlyif  => "test ! -d ${location}"
  }

}
