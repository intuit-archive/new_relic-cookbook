define :new_relic_java_agent_config do
  node.set['new_relic']['app_agent']['config_file'] = params[:name]
  include_recipe 'new_relic::java_agent'
end
