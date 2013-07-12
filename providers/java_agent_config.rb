action :create do
  node.set['new_relic']['app_agent']['config_file'] = params[:name]
  include_recipe 'new_relic::java_agent'
  new_resource.updated_by_last_action(true)
end
