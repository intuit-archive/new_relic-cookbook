actions :create

default_action :create

attribute :app_name,     :kind_of => String
attribute :command_path, :kind_of => String, :required => true
attribute :environment,  :kind_of => String
attribute :proxy,        :kind_of => [TrueClass, FalseClass], :default => false
attribute :proxy_host,   :kind_of => String
attribute :proxy_port,   :kind_of => String
attribute :revision,     :kind_of => String
attribute :user,         :kind_of => String, :default => ENV['SUDO_USER'] ||
                                                         ENV['USER'] ||
                                                         'root'
