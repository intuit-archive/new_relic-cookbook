template node['new_relic']['app_agent']['config_file'] do
  source 'java_agent_newrelic.yml.erb'
  variables :config_var => node['new_relic']['app_agent'],
            :license_key => node['new_relic']['license_key']
end
