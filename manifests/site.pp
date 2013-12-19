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
  listen_port => 8080,
}

file { ['/var/www', '/var/www/demo']:
	ensure => directory,
}

file { '/var/www/demo/index.html':
	source => '/vagrant/manifests/exercise-webpage/index.html',
	ensure => present,
}