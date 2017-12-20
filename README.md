# Fareharbor::Ruby

A Ruby client for interacting with the [Fareharbor API](https://github.com/FareHarbor/fareharbor-docs).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fareharbor-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fareharbor-ruby

## Usage

Before getting started with the [Fareharbor API](https://github.com/FareHarbor/fareharbor-docs), you'll need to [get access credentials](mailto:sales+api@fareharbor.com).

### Configuration

Once you have your token, start by configuring the Fareharbor object. If you are using Rails, put the following into `config/initializers/fareharbor.rb`:

```ruby
Fareharbor.configure do |config|
  config.app_token  = ENV['FAREHARBOR_APP_TOKEN']
  config.user_token = ENV['FAREHARBOR_USER_TOKEN']
end
```

_(It's a good idea to set your credentials in environment variables)_

### Basic Usage

For more information about what resources are available, please refer to the [Fareharbor API Documentation](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md).

```ruby
companies = Fareharbor::Company.all
# => Returns an array of company objects
company = companies.detect { |c| c.name == 'Hawaiian Adventures' }
# => Returns a single company object (or nil if not found)
agents = company.agents
# => Returns an array of agents for this company
availability_logdings = company.availability_logdings(availability_id: '1234')
# => Returns an array of logdings for the specified availability
desks = company.desks
# => Returns an array of desks for this company
items = company.items
# => Returns an array of items for this company
item = items.first
# => Returns a single item
item.customer_prototypes
# => Returns an array of customer_prototypes for this item
item.images
# => Returns an array of images for this item
lodgings = company.lodgings
# => Returns an array of lodgings for this company
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fareharbor-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Fareharbor::Ruby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fareharbor-ruby/blob/master/CODE_OF_CONDUCT.md).
