$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

require 'grape'
require 'grape-skylight'
