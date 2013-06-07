template node['new_relic']['app_agent']['config_file'] do
  source 'ruby_agent_newrelic.yml.erb'
  variables :config      => node['new_relic']['app_agent'],
            :license_key => node['new_relic']['license_key'],
            :proxy       => node['new_relic']['proxy']
end
