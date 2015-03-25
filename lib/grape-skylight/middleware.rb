require 'grape'
require 'skylight'

module Skylight
  module Grape
    # Middleware to enable Skylight reporting with Grape.
    class Middleware < ::Grape::Middleware::Base
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env).tap do
          # get the instrumenter instance, or skip
          instrumenter = Skylight::Instrumenter.instance
          next unless instrumenter
          trace = instrumenter.current_trace
          next unless trace

          # produces a string to represent the route like: GET /hello/:name
          request = env['api.endpoint'].routes.first
          request_route = request.route_path.sub(/\(\.:format\)\z/, '')
          name = "#{request.route_method} #{request_route}"

          # set the endpoint to our route
          trace.endpoint = name
        end
      end
    end
  end
end
