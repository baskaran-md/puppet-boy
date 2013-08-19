class ssh::install {
	package { 'openssh':
		ensure => present,
		require => Class['ssh::dependencies'],
	}
}
