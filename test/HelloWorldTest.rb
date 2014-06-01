ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), 'hello_world.rb')
require "test/unit"
require "rack/test"

class HelloWorldTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end
	def test_it_says_hello_world
		get '/'
		assert last_response.ok?
		assert_equal 'Hello world!', last_response.body		
	end
end