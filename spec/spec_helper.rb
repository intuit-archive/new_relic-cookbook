require 'rubygems'
require 'bundler/setup'

libs = File.expand_path("../../libraries", __FILE__)

require "chef"
require "#{libs}/new_relic_http_proxy"

RSpec.configure do |config|
  #spec config
end
