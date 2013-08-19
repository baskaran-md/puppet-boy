class sudo {
	$file_name = "/tmp/baskar"
	file { $file_name :
		owner => "root",
		group => "root",
		mode => 0440,
		source => "puppet:///modules/sudo/etc/baskar",
	}
	
	$file_name_raj = "/tmp/rajesh"
	file { $file_name_raj :
		owner => "root",
		group => "root",
		mode => 0777,
		source => "puppet:///modules/sudo/etc/rajesh",
	}
}
