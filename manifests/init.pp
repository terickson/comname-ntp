class ntpx (
	$drift_file_path,
	$ntp_servers,
	$ntp_package_name = $ntpx::params::ntp_package_name,
	$ntp_service_name = $ntpx::params::ntp_service_name,
	$ntp_config_file_path = $ntpx::params::ntp_config_file_path,
) inherits ntpx::params {
	
	package { $ntp_package_name:
		ensure => 'latest',
	}

	file { $ntp_config_file_path:
		ensure 	=> 'file',
		content => template('ntpx/config_file.erb'),
		mode	  => '0644',
	}

	file { $drift_file_path:
		ensure 	=> 'file',
		mode	  => '0755',
	}

	service { $ntp_service_name:
		ensure 	  => 'running',
		require   => Package[$ntp_package_name],
		subscribe => File[$ntp_config_file_path],
	}
}
