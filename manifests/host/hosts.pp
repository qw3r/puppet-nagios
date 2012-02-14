define nagios::host::hosts() {
	@@nagios_host { "$name":
		ensure     => present,
		alias      => $::fqdn,
		address    => $::ipaddress,
		hostgroups => $::lsbdistcodename,
		use        => "generic-host",
		target     => "/etc/nagios3/conf.d/${::fqdn}_hosts.cfg",
	}
}

# vim: tabstop=3