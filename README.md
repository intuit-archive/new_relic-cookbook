# new_relic-cookbook cookbook

# Requirements
* Chef 10.x

Platform:
* CentOS 6.x
* RHEL 6.x

# Usage
Add this to your run list

# Attributes
## Default
`node['new_relic']['license_key']` - Default value: 'change_me'

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
## java_agent
Installs and configures the new_relicy java app agent
new_relic::java_agent

## ruby_agent
Installs and configures the new_relic ruby app agent
new_relic::ruby_agent

## server_monitor
Installs and configures the new_relic server agent
new_relic::server_monitor


# Author

Author:: Intuit, Inc. (<kevin_young@intuit.com>)
