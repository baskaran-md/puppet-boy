$MyText = "Global"

#Master
node 'ip-10-138-30-54.ap-southeast-1.compute.internal' {
	package { 'nginx':
		ensure => present,
	}
}

class fileCreation {
	$MyText = "Local FileCreation"
        file { '/tmp/mytext':
                content => $MyText,
        }
}

class admin {
	include fileCreation
}

#CentOs 2
node default inherits 'ip-10-138-30-54.ap-southeast-1.compute.internal' {
	include sudo
	$MyText = "Local Default"
	file { '/tmp/mytext':
		content => $MyText,
	}

	package { 'httpd':
		 ensure => present, 
	}
	service { 'httpd':
		require => Package['httpd'],
		ensure => stopped,
	}
}

#RHEL
node 'ip-10-136-10-116.ap-southeast-1.compute.internal' {
	$MyText = "Local RHEL"
	include admin
}

#CentOs 1
node 'ip-10-128-211-252.ap-southeast-1.compute.internal' inherits 'ip-10-136-10-116.ap-southeast-1.compute.internal' {
	$MyText = "Local CentOs"

	service { 'nginx':
		ensure => stopped,
	}
}

