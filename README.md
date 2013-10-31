# Shoplo::Api

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'shoplo-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shoplo-api

## Usage

Configure:
```ruby

Shoplo.configure do |conf|
  conf.api_key = 'api_key'
  conf.secret = 'secret'
end
```

Create a client, and use it to call the Shoplo API.

```ruby

client = Shoplo::Client.new('access_token', 'token_secret')

client.get_shop

client.get_products

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
