template node['new_relic']['app_agent']['config_file'] do
  source 'newrelic.yml.erb'
  variables :config_var => node['new_relic']['app_agent'],
            :license_key => node['new_relic']['license_key'],
            :proxy       => node['new_relic']['proxy']
end
