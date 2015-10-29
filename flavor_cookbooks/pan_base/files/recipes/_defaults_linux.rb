if platform_family?('debian', 'rhel')
  node.set['omnibus_updater']['version'] = '12.3.0'
  node.set['omnibus_updater']['restart_chef_service'] = true
  include_recipe 'omnibus_updater'

  # Install CA certificate
  directory '/etc/chef/trusted_certs' do
    recursive true
    action :create
  end

  # If you are running your own CA
  # bundle your public certificate with the cookbook
  # and use a cookbook_file resource to drop it on the machine
  # in /etc/chef/trusted_certs
end
