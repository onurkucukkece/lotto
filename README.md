# Lotto
[![Gem Version](https://badge.fury.io/rb/lotto.svg)](https://badge.fury.io/rb/lotto) [![Coverage Status](https://coveralls.io/repos/github/onurkucukkece/lotto/badge.svg?branch=master)](https://coveralls.io/github/onurkucukkece/lotto?branch=master) [![Build Status](https://travis-ci.org/onurkucukkece/lotto.svg?branch=master)](https://travis-ci.org/onurkucukkece/lotto)

A customizable lottery gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lotto', '~> 0.5.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lotto

## Usage

```ruby
  lotto = Lotto::Draw.new
  lotto.play({ pick: 6, of: 49 }) # will return an array
  lotto.play({ pick: 6, of: 49 }).sort.join(' - ')

  # Multiple draws
  lotto.play({ pick: 6, of: 49, for: 5 })

  # Exclude numbers
  lotto.play({ pick: 6, of: 49, exclude: [6, 23] })
  
  # Include numbers
  lotto.play({ pick: 6, of: 49, include: [1, 8] })
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/onurkucukkece/lotto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lotto project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/onurkucukkece/lotto/blob/master/CODE_OF_CONDUCT.md).
