require 'grape'
require 'skylight'

module Skylight
  module Grape
    class Middleware < ::Grape::Middleware::Base
      def initialize(app)
        @app = app
      end

      def call(env)
        request = env['api.endpoint'].routes.first
        request_route = request.route_path.sub(/\(\.:format\)\z/, '')
        # produces a string like: GET /hello/:name
        name = "#{request.route_method} #{request_route}"

        ::Skylight.trace(name) do
          @app.call(env)
        end
      end
    end
  end
end
