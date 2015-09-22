if platform_family? 'windows'
  # Install CA certificate
  directory 'C:/chef/trusted_certs' do
    recursive true
    action :create
  end
  # If you are running your own CA
  # bundle your public certificate with the cookbook
  # and use a cookbook_file resource to drop it on the machine
  # in C:/chef/trusted_certs

  # install chocolatey so we have package management
  include_recipe 'chocolatey'

  # If you like optimizations like the one below, check out Boxstarter
  # http://www.boxstarter.org/
  # always display all items in the tray
  registry_key 'HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer' do
    values [{ name: 'EnableAutoTray', type: :dword, data: 00000000 }]
    recursive true
    action :create
  end

  # Eliminate DSC collisions with Chef by disabling LCM.
  powershell_script 'apply_lcm' do
    code <<-EOH
    configuration LCM
    {
      LocalConfigurationManager
      {
        ConfigurationMode = "ApplyOnly"
      }
    }
    LCM -OutputPath #{Chef::Config[:file_cache_path]}
    Set-DscLocalConfigurationManager -Path #{Chef::Config[:file_cache_path]}
    EOH
    not_if '(Get-DscLocalConfigurationManager).ConfigurationMode -eq "ApplyOnly"'
  end

  # If you are using DSC you will need to remote_file and install any DSC extensions you are using.
end
