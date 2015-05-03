class build_firewall($firewall_data = false) {

  include build_firewall::pre
  include build_firewall::post
  include firewall

  resources { "firewall":
  purge => true
  }

  Firewall {
    before  => Class['build_firewall::post'],
    require => Class['build_firewall::pre'], 
  }

  if $firewall_data != false {
    create_resources('firewall', $firewall_data)
  }

}
