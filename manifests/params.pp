class ntpx::params {
	case $::osfamily {
      'Solaris': { 
      		$ntp_package_name = 'ntp.pkg'
      		$ntp_service_name = 'ntpd'
			    $ntp_config_file_path = '/etc/inet/ntp.conf'
       }
      'RedHat': { 
      		$ntp_package_name = 'ntp'
      		$ntp_service_name = 'ntpd'
			    $ntp_config_file_path = '/etc/ntp.conf'
       }
      default: {
      		fail('OS not supported') 
      }
    }
}