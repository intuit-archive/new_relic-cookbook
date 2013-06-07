package node['new_relic']['server_monitor']['package_name'] do
  version node['new_relic']['server_monitor']['version']
end

directory File.basename(node['new_relic']['server_monitor']['log_file']) do
  owner 'root'
  group 'root'
  mode '0777'
end

service node['new_relic']['server_monitor']['service_name'] do
  action [:enable]
  supports :status => true, :restart => true
end

if node['new_relic']['proxy']['enabled']
  proxy_url = NewRelicHTTPProxy.new(node['new_relic']['proxy'].to_hash).to_url
end

template node['new_relic']['server_monitor']['config_file'] do
  owner 'root'
  group 'newrelic'
  mode '0640'
  source 'nrsysmond.cfg.erb'
  variables :config        => node['new_relic']['server_monitor'],
            :license_key   => node['new_relic']['license_key'],
            :proxy_enabled => node['new_relic']['proxy']['enabled'],
            :proxy_url     => proxy_url
  notifies :restart,
           resources(:service => node['new_relic']['server_monitor']['service_name'])
end

service node['new_relic']['server_monitor']['service_name'] do
  action [:start]
end
