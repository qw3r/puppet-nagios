define nagios::service::services($command = false, $group = false) {
	$t_group = $group ? {
		false   => $name,
		default => $group,
	}

	if $t_group =~ /(disk|interfaces|smart)/ {
		$t_command = "${command}${name}"
	} else {
		$t_command = $command
	}

	@@nagios_service { "${::fqdn}_${name}":
		ensure              => present,
		check_command       => $t_command,
		host_name           => $::fqdn,
		servicegroups       => $t_group,
		service_description => $name,
		use                 => "generic-service",
		target              => "/etc/nagios3/conf.d/${::fqdn}_services.cfg",
	}
}

# vim: tabstop=3