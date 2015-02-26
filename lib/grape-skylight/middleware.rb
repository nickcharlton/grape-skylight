require 'grape'
require 'skylight'

module Skylight
  module Grape
    class Middleware < ::Grape::Middleware::Base
      def initialize(app)
        @app = app
      end

      def call(env)
        ::Skylight.trace(name) do
          @app.call(env)
        end
      end
    end
  end
end
