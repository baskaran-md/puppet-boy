class ssh::service {
	service { 'sshd':
		ensure => running,
		require => Class["ssh::config"],
	}
}
