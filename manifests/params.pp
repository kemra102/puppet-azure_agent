class azure_agent::params {

  # Set the package name (Ubuntu is different)
  case $::operatingsystem {
    'Ubuntu':      { $package_name = 'walinuxagent' }
    'Centos':      { $package_name = 'WALinuxAgent' }
    'OracleLinux': { $package_name = 'WALinuxAgent' }
    'SLES':        { $package_name = 'WALinuxAgent' }
    'OpenSuSE':    { $package_name = 'WALinuxAgent' }
    default:       {
      fail("${::operatingsystem} is not supported by ${::module_name}")
    }
  }

  # Config file options
  case $::operatingsystem {
    'Ubuntu': { $provisioning_enabled = 'n' }
    default:  { $provisioning_enabled = 'y' }
  }
  $provisioning_deleterootpassword       = 'n'
  $provisioning_regeneratesshhostkeypair = 'y'
  $provisioning_sshhostkeypairtype       = 'rsa'
  $provisioning_monitorhostname          = 'y'
  $resourcedisk_format                   = 'y'
  case $::operatingsystem {
    'SLES':  { $resourcedisk_filesystem  = 'ext3' }
    default: { $resourcedisk_filesystem  = 'ext4' }
  }
  $resourcedisk_mountpoint               = '/mnt/resource'
  $resourcedisk_enableswap               = 'n'
  $resourcedisk_swapsizemb               = '0'
  $lbproberesponder                      = 'y'
  $logs_verbose                          = 'n'
  $os_rootdevicescsitimeout              = '300'
  $os_opensslpath                        = 'None'

}
