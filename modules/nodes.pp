package {'openssl':
	ensure => present,
	before => File['/etc/ssh/sshd_config'],
}

file {'ssh-config':
	ensure => file,
	path => '/etc/ssh/sshd_config',
	mode => 600,
	replace => no, # dont overwrite
	source => '/root/examples/sshd_config'	
}


service {'sshd':
	ensure => running, # same as service sshd start
	enable => true, #same as chkconfig sshd on
	subscribe => File['/etc/ssh/sshd_config'],
}

# puppet parser validate site.pp
# puppet-lint site.pp 
# puppet apply site.pp