action :create do
  node.set['new_relic']['app_agent']['config_file'] = new_resource.name

  template node['new_relic']['app_agent']['config_file'] do
    cookbook new_resource.cookbook
    source 'java_agent_newrelic.yml.erb'
    variables :config      => node['new_relic']['app_agent'],
              :license_key => node['new_relic']['license_key'],
              :proxy       => node['new_relic']['proxy']
  end

  new_resource.updated_by_last_action(true)
end