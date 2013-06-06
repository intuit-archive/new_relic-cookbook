require 'uri'

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

proxy     = node['new_relic']['proxy'].to_hash
proxy_url = URI::HTTP.build(:scheme   => proxy['scheme'],
                            :userinfo => "#{proxy['user']}:#{proxy['password']}",
                            :host     => proxy['host'],
                            :port     => proxy['port']).to_s

template node['new_relic']['server_monitor']['config_file'] do
  owner 'root'
  group 'newrelic'
  mode '0640'
  source 'nrsysmond.cfg.erb'
  variables :config => node['new_relic'],
            :proxy  => proxy_url
  notifies :restart,
           resources(:service => node['new_relic']['server_monitor']['service_name'])
end

service node['new_relic']['server_monitor']['service_name'] do
  action [:start]
end
