class ssh::config {
	$sshFile = "/etc/ssh/sshd_config"

	file { $sshFile:
		#source	=> "puppet:///modules/ssh/sshd_config_centos",
		source	=> $operatingsystem ? {
			/(Ubuntu | RedHat)/ => "puppet:///modules/ssh/sshd_config_rhel",
			CentOs	=> "puppet:///modules/ssh/sshd_config_centos",
		},
		
		ensure	=> "present",
		owner	=> "root",
		group	=> "root",
		mode	=> "0660",
		require	=> Class["ssh::install"],
		notify	=> Class["ssh::service"],
	}
}
