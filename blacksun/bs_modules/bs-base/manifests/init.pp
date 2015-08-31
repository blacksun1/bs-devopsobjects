# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'base':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Simon Bruce <simon@blacksun.cx>
#
# === Copyright
#
# Copyright 2015 Simon Bruce, unless otherwise noted.
#
class base {

	package { 'man-db':
		ensure => installed,
	}

	package { 'vim':
		ensure => installed,
	}

	file { 'standardprompt.sh':
		path   => '/etc/profile.d/standardprompt.sh',
		ensure => 'present',
		source => 'puppet:///modules/bs-base/standardprompt.sh',
		mode   => 755,
	}

}
