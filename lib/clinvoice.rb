# frozen_string_literal: true

require 'clinvoice/initialize_template'
require 'clinvoice/generate_next_template'
require 'clinvoice/generate_pdf'
require 'clinvoice/version'

module Clinvoice
  def self.execute(args)
    show_usage_and_exit! if args.empty?

    command = args[0]
    file = args[1]

    case command
    when 'init'
      Clinvoice::InitializeTemplate.call(file)
    when 'new'
      Clinvoice::GeneratePDF.call(file)
    else
      show_usage_and_exit!
    end
  end

  def self.show_usage_and_exit!
    puts <<~USAGE
      Usage:

        clinvoice init <datafile> # starts a new template with id 1 and empty entries.
        clinvoice new <filename> # generates a pdf invoice based on a data file `yml`.

      Args:

        - datafile: the yaml template without number and extention, example 'doge' ('doge-*.yml' templates)
        - filename: the yaml template with number but without extention, example 'doge-3' ('doge-3.yml' templates)

      Examples / Flow:

        1 - First lets create a new client template:

          `$ clinvoice init doge-client`

          This will create a `doge-client-1.yml` data file, lets edit it and generate our pdf invoice.

        2 - Edit the data file:

          `$ vim doge-client-1.yml`

        3 - Now we can generate our pdf invoice based on the data file

          `$ clinvoice new doge-client-1`

          This will create a `doge-client-1.pdf` file based on the data file `doge-client-1.yml`.

    USAGE

    exit
  end
end
