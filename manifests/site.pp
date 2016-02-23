class sudo {
	file { "/etc/sudoers"
		owner => root,
		group => root,
		mode => 440,

		}
}

node default {
	include sudo
}
class test {
	group { "kasutajad": ensure => present }
	group { "direktorid": ensure => present }
	user { "mati":
		ensure => present,
		home => "/home/mati",
		comment => "Mati Mets",
		managehome => true,
		shell => "/bin/bash",
		groups => ["kasutajad", "direktorid"]
	}

	user { "kati":
		ensure => present,
		home => "/home/kati",
		comment => "Kati Mets",
		managehome => true,
		shell => "/bin/bash",
		groups => ["kasutajad"]
	}

	user { "john": ensure => absent }
	package { ["mc", "ssh"]: ensure => present}
}
node default{
	include test
}
