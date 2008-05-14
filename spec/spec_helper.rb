$: << File.dirname(__FILE__) + '/../lib' << File.dirname(__FILE__)

require 'rubygems'
require 'spec'

if File.exists?(File.dirname(__FILE__) + '/../../../../vendor/rails')
  $: << File.dirname(__FILE__) + '/../../../../vendor/rails'
  require 'activesupport/lib/active_support'
  require 'activerecord/lib/active_record'  
  require 'railties/lib/rails/version'  
  
  vendored_rails = true  
  puts "Using vendored Rails version #{Rails::VERSION::STRING}"
else  
  require 'active_record'
  require 'active_record/version'
  require 'rails/version'
  
  vendored_rails = false
  puts "Using gem Rails version #{Rails::VERSION::STRING}"
end


Time.zone_default = Time.send!(:get_zone, 'UTC') if vendored_rails

require 'validates_timeliness'

ActiveRecord::Base.establish_connection({:adapter => 'sqlite3', :database => ':memory:'})

require 'resources/schema'
require 'resources/person'
