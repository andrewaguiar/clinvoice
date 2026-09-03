# Clinvoice

Generates invoices using command line based on yaml files

```shell
clinvoice init <datafile> # starts a new template with id 1 and empty entries.
clinvoice new <filename> # generates a pdf invoice based on a data file `yml`.
clinvoice next <datafile> # generates the next data file `yml`, based on the last one.
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

`issue_date` and `due_date` are optional; add them to the data file to have them printed on the invoice:

```yaml
data:
  issue_date: "2021-08-11"
  due_date: "2021-09-11"
```

2 - Edit the data file:

    $ vim doge-client-1.yml

3 - Now we can generate our pdf invoice based on the data file

    $ clinvoice new doge-client-1

This will create a `doge-client-1.pdf` file based on the data file `doge-client-1.yml`. You can also pass the filename with the `.yml` extension, e.g. `clinvoice new doge-client-1.yml`.

4 - Generate a next datafile

    $ clinvoice next doge-client

This will create a `doge-client-2.yml` data file, based on the last data file:

- `id` is incremented.
- `issue_date` and `due_date` are advanced by one month (rolling over the year when needed), keeping the `MM/dd/YYYY` format.
- Any `Mon YYYY` occurrence in item descriptions (e.g. `Aug 2026`) is advanced by one month too (e.g. `Sep 2026`).
- Everything else (items, notes, contractor, client, currency, etc.) is copied as is.

If the `$EDITOR` environment variable is set, the new data file is opened in it automatically.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andrewaguiar/clinvoice. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Clinvoice project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/andrewaguiar/clinvoice/blob/master/CODE_OF_CONDUCT.md).
