# Gemfile
require "rubygems"
require "bundler/setup"
require "sinatra"
require "slim"
require "RMagick"
require "fileutils"
require "#{File.dirname(__FILE__)}/helpers/helper.rb"
require File.join(File.dirname(__FILE__), 'app.rb')
 
set :run, false
set :raise_errors, true

use Rack::Session::Cookie, :key => 'rack.session',
                           :domain => 'localhost:9292',
                           :path => '/',
                           :expire_after => 200, # In seconds
                           :secret => 'LOV3L1NUX'

 
run Sinatra::Application