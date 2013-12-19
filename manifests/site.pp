group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "This is Brad Dixon's <rbdixon@gmail.com> submission to Puppet Labs.\n\n"
}

class { 'nginx': }

nginx::resource::vhost { 'demo':
  ensure   => present,
  www_root => '/var/www/demo',
}