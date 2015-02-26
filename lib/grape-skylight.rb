require 'grape'
require 'grape/extensions/skylight'

module Grape
  module Middleware
    autuload :SkylightMiddleware, 'grape/middleware/skylight_middleware'
  end
end
