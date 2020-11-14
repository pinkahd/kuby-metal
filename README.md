# Kuby::Metal

Bare metal provider for [Kuby](https://github.com/getkuby/kuby-core). Allows deployment to a bare metal kubernetes cluster.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kuby-metal'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install kuby-metal

## Usage

```ruby
Kuby.define("MyApp") do
  environment(:production) do
    kubernetes do
      provider :metal do
        kube_config_path "~/.kube/config"
      end
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pinkahd/kuby-metal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/pinkahd/kuby-metal/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Kuby::Metal project's codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pinkahd/kuby-metal/blob/master/CODE_OF_CONDUCT.md).
