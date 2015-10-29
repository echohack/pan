iis_config = "#{node['app']['file_cache_path']}\\iis_config.ps1"

template iis_config do
  source 'iis_config.ps1.erb'
  variables(
    pool_user: 'MyNewAppPool',
    pool_password: 'StoreMeInAVaultOrGetHacked',
    site_name: 'MySiteName',
    site_path: 'MySitePath',
    webapp1_path: 'WebApp1Path',
    webapp2_path: 'WebApp2Path',
    webapp3_path: 'WebApp3Path'
  )
end

dsc_script 'iis_config' do
  command iis_config
end
