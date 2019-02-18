# Clinvoice

Generates invoices using command line based on yaml files

```shell
clinvoice init <datafile> # starts a new template with id 1 and empty entries.
clinvoice new <filename> # generates a pdf invoice based on a data file `yml`.
clinvoice next <datafile> # generates the next data file `yml`.
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clinvoice'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clinvoice

## Usage

1 - Create a new client template:

    $ clinvoice init doge-client

This will create a `doge-client-1.yml` data file.

```yaml
data:
  id: 1
  currency: "USD"
  contractor:
    name: "You"
    address:
      line1: "123, Street, 451233"
      line2: "City, State, Country"
  client:
    name: "Your Client"
    address:
      line1: "123, Street, 451233"
      line2: "City, State, Country"
  items:
    -
      description: "Example service 1"
      quantity: 1
      unit_cost: 1.00
    -
      description: "Example service 2"
      quantity: 1
      unit_cost: 2.00
  notes: "footer notes optional"
```

2 - Edit the data file:

    $ vim doge-client-1.yml

3 - Now we can generate our pdf invoice based on the data file

    $ clinvoice new doge-client-1

This will create a `doge-client-1.pdf` file based on the data file `doge-client-1.yml`.

4 - Generate a next datafile

    $ clinvoice next doge-client

This will create a `doge-client-2.yml` data file, based on the last data file id + 1.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/clinvoice. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Clinvoice project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/clinvoice/blob/master/CODE_OF_CONDUCT.md).
