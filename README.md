# New Relic Cookbook

# Requirements
* Chef 10.x or greater

Platform:
* CentOS 6.x
* RHEL 6.x

# Usage
## Server Monitor Agent
Add `recipe[new_relic::server_monitor]` to your run list.

## LWRPs
Ensure `recipe[new_relic]` is in run_list.

# Attributes
## Default
`node['new_relic']['license_key']` - Default value: 'change_me'

`node['new_relic']['proxy']['enabled']` - Default value: false

`node['new_relic']['proxy']['host']` - Default value: nil

`node['new_relic']['proxy']['port']` - Default value: nil

`node['new_relic']['proxy']['user']` - Default value: nil

`node['new_relic']['proxy']['password']` - Default value: nil

`node['new_relic']['proxy']['scheme']` - Default value: 'http'

`node['new_relic']['app_agent']['apdex_t']` - Default value: '0.5'

`node['new_relic']['app_agent']['app_name']` - Default value: 'change_me'

`node['new_relic']['app_agent']['capture_params']` - Default value: false

`node['new_relic']['app_agent']['developer_mode']` - Default value: false

`node['new_relic']['app_agent']['config_file']` - Default value: 'change_me'

`node['new_relic']['app_agent']['log_level']` - Default value: 'info'

`node['new_relic']['app_agent']['monitor_mode']`   Default value: true

`node['new_relic']['app_agent']['ssl']` Default value: true

`node['new_relic']['server_monitor']['config_file']` - config file location, default value: '/etc/newrelic/nrsysmond.cfg'

`node['new_relic']['server_monitor']['log_file']` - log file location, default value: '/var/log/newrelic/nrsysmond.log'

`node['new_relic']['server_monitor']['package_name']` - Name of the RPM, default value: 'newrelic-sysmond'

`node['new_relic']['server_monitor']['pid_file']` - Default value: '/var/run/newrelic/nrsysmond.pid'

`node['new_relic']['server_monitor']['service_name']` - Default value: 'newrelic-sysmond'

`node['new_relic']['server_monitor']['ssl']` - Default value: true

`node['new_relic']['server_monitor']['version']` - Version of the rpm that is installed, default value: latest version

# Recipes
## server_monitor
Installs and configures the new_relic server monitor agent. This assumes that
the server monitor package is available through your own yum repository.

# LWRPs
## app_agent_config
Configures the new_relic app agent. It is expected that you have bundled
the agent with your app.

### Actions:
- default action: `:create`
- `:create` adds your New Relic YAML config to path specified by `full_path`

### Provider Options:
* Chef::Provider::NewRelicRubyAppAgentConfig
* Chef::Provider::NewRelicJavaAppAgentConfig

### Associated Attributes:
#### required
`node['new_relic']['app_agent']` (please review app_agent attributes section above)

`node['new_relic']['license_key']`

#### optional
`node['new_relic']['proxy']` (please review proxy attributes section above)

### LWRP attributes:
* `full_path` - specifies the absolute path to the new relic config file, default value: name of the resource
* `cookbook` - specifies which cookbook to get template file from.  default is `new_relic`

### Example
``` ruby
app_agent_config "/my_app_root/config/newrelic.yml" do
  provider Chef::Provider::NewRelicRubyAppAgentConfig
end
```

## java_deployment_record
Creates a new deployment marker in new relic executing new relic jar via "java -jar command_path deployment" with provided options.

- `:create` adds a deployment marker for your app name specified by `name`

### LWRP attributes:
* `app_name` - the name of your application
* `command_path` - absolute path and filename of deployment marker jar. (required)
* `environment` - environment in New Relic that node belongs to
* `proxy` - use proxy to execute deployment marker call. The default is false.
* `proxy_host` - proxy host name or ip
* `proxy_port` - proxy port
* `revision` - revision id of deployment marker
* `user` - user executing the deployment marker call. This attribute looks to see if there is a SUDO_USER environment variable.  If not, it looks to see if there is a USER environment variable.  If not, it will use 'root'.

### Example

``` ruby
new_relic_java_deployment_record "app_name" do
  action :create
  app_name "value to pass as --appname"
  command_path "path to newrelic jar"
  environment "value to pass as --environment"
  proxy true
  proxy_host myhost.example.com
  proxy_port 8080
  revision "value to pass to --revision"
  user "value to pass as --user"
end
```

## ruby_deployment_record
Creates a new deployment marker in new relic by executing `bundle exec newrelic deployment` with provided options. ```NOTE: this currently does not support
working through a proxy```

- `:create` adds a deployment marker for your application

### LWRP attributes:
* `app_name` - the name of your application
* `command_path` - absolute path and filename of deployment marker jar. (required)
* `environment` - environment in New Relic that node belongs to
* `proxy` - use proxy to execute deployment marker call. The default is false.
* `proxy_host` - proxy host name or ip
* `proxy_port` - proxy port
* `revision` - revision id of deployment marker
* `user` - user executing the deployment marker call. This attribute looks to see if there is a SUDO_USER environment variable.  If not, it looks to see if there is a USER environment variable.  If not, it will use 'root'.

### Example

``` ruby
new_relic_ruby_deployment_record "app_name" do
  action :create
  app_name "value to pass as --appname"
  cwd "directory to change to before executing command"
  environment "value to pass as --environment"
  revision "value to pass to --revision"
  user "value to pass as --user"
end
```

# Author

- Author:: Kevin Young (<kevin_young@intuit.com>)
- Copyright:: 2013, Intuit, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
