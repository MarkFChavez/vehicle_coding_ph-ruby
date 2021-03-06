# VehicleCodingPh

[![Build Status](https://travis-ci.org/MarkFChavez/vehicle_coding_ph-ruby.svg?branch=master)](https://travis-ci.org/MarkFChavez/vehicle_coding_ph-ruby)

Helps you figure out if your car is legally okay to drive on a given date in the Philippines.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vehicle_coding_ph'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vehicle_coding_ph

## Usage

```ruby
# returns a `VehicleCodingPh::Response` object
VehicleCodingPh::Checker.(
  plate_number_of_your_vehicle, 
  datetime # if not passed, defaults to datetime today
)

# VehicleCodingPh::Response object returns:
- coding: boolean
- allowed: array of areas allowed to go
- not_allowed: array of areas not allowed to go
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MarkFChavez/vehicle_coding_ph. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CodingPh project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/MarkFChavez/vehicle_coding_ph/blob/master/CODE_OF_CONDUCT.md).
