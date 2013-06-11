action :create do
  cmd = command_to_run
  Chef::Log.debug "new relic java deployment command to run: #{cmd}"

  execute 'mark deployment in new relic' do
    command cmd
    ignore_failure new_resource.ignore_failure
  end
end

private
def command_to_run
  command = "java #{proxy_settings}"
  command << " -jar #{new_resource.command_path} deployment"
  command << " --user #{new_resource.user}"
  command << [app_name, environment, revision].join
end

def app_name
  return '' if new_resource.app_name.nil? || new_resource.app_name.empty?
  " --appname #{new_resource.app_name}"
end

def environment
  return '' if new_resource.environment.nil? || new_resource.environment.empty?
  " --environment #{new_resource.environment}"
end

def proxy_host
  new_resource.proxy_host
end

def proxy_port
  new_resource.proxy_port
end

def proxy_settings
  return '' unless new_resource.proxy
  proxy_config = "-Dhttps.proxySet=true"
  proxy_config << " -Dhttps.proxyHost=#{proxy_host}"
  proxy_config << " -Dhttps.proxyPort=#{proxy_port}"
end

def revision
  return '' if new_resource.revision.nil? || new_resource.revision.empty?
  " --revision #{new_resource.revision}"
end
