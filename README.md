# grape-skylight

[Skylight][] metrics support for [Grape][].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-skylight'
```

Or install:

```
gem install grape-skylight
```

## Usage

You can include it in your API like this:

```ruby
class TestAPI < Grape::API
  use Skylight::Grape::Middleware

  get '/hello/:name' do
    "Hello #{params[:name]}!"
  end
end
```

If you're mounting inside a Rails application, this is all you need to do.
Otherwise, you'll need to ensure `Skylight.start!` is called and you've run
through the other configuration mentioned in the [Agent docs][].

## Contributing

1. Fork it ( https://github.com/nickcharlton/grape-skylight/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Author

Copyright Nick Charlton 2015. <nick@nickcharlton.net>.

[Skylight]: https://skylight.io
[Grape]: https://github.com/intridea/grape
[Agent docs]: https://docs.skylight.io/agent/
