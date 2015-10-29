# Your organization's chef-client settings
interval = 600
splay = 300
node.set['chef_client']['interval'] = interval
node.set['chef_client']['splay'] = splay

# Requires Chef 12 client or a new version of Chef 11 client
# Always explicitly set security settings: validate SSL
node.set['chef_client']['config']['verify_api_cert'] = true
node.set['chef_client']['config']['ssl_verify_mode'] = ':verify_peer'

include_recipe 'chef-client::config'
include_recipe 'chef-client::service'
include_recipe 'chef-client::delete_validation'
