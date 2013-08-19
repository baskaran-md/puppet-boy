class ssh {
	include ssh::dependencies
	include ssh::config
	include ssh::install
	include ssh::service
}
