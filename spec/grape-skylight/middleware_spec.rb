require 'spec_helper'

describe Skylight::Grape::Middleware do
  # Example API for testing the middleware.
  class TestAPI < Grape::API
    use Skylight::Grape::Middleware

    get '/hello/:name' do
      "hello #{params['name']}"
    end
  end

  def app
    TestAPI
  end

  it 'wraps a request in a Skylight instrument' do
    expect(::Skylight).to receive(:trace).with('GET /hello/:name').and_yield

    get '/hello/nick'

    expect(last_response.status).to eq 200
    expect(last_response.body).to eq 'hello nick'
  end
end
