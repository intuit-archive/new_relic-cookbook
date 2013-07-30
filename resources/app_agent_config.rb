actions :create
default_action :create

attribute :full_path, :kind_of => String, :name_attribute => true
attribute :cookbook, :kind_of => String, :default => "new_relic"
