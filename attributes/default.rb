default['new_relic']['license_key'] = 'change_me'

default['new_relic']['proxy']['enabled']  = false
default['new_relic']['proxy']['host']     = nil
default['new_relic']['proxy']['port']     = nil
default['new_relic']['proxy']['user']     = nil
default['new_relic']['proxy']['password'] = nil
default['new_relic']['proxy']['scheme']   = 'http'

default['new_relic']['app_agent']['apdex_t']        = '0.5'
default['new_relic']['app_agent']['app_name']       = 'change_me'
default['new_relic']['app_agent']['capture_params'] = false
default['new_relic']['app_agent']['config_file']    = 'change_me'
default['new_relic']['app_agent']['developer_mode'] = false
default['new_relic']['app_agent']['log_level']      = 'info'
default['new_relic']['app_agent']['monitor_mode']   = true
default['new_relic']['app_agent']['ssl']            = true

default['new_relic']['server_monitor']['config_file']  = '/etc/newrelic/nrsysmond.cfg'
default['new_relic']['server_monitor']['log_file']     = '/var/log/newrelic/nrsysmond.log'
default['new_relic']['server_monitor']['package_name'] = 'newrelic-sysmond'
default['new_relic']['server_monitor']['pid_file']     = '/var/run/newrelic/nrsysmond.pid'
default['new_relic']['server_monitor']['service_name'] = 'newrelic-sysmond'
default['new_relic']['server_monitor']['ssl']          = true
default['new_relic']['server_monitor']['version']      = nil
