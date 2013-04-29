define :new_relic_java_agent_config do
  node.set['new_relic']['app_agent']['file_path'] = params[:name]
  include_recipe 'new_relic::java_agent'
end
