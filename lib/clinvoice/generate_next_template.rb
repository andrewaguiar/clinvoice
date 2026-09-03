# frozen_string_literal: true

require 'yaml'
require 'date'

module Clinvoice
  module GenerateNextTemplate
    DATE_FORMAT = '%m/%d/%Y'
    MONTH_YEAR_REGEX = /\b(#{Date::ABBR_MONTHNAMES.compact.join('|')}) (\d{4})\b/.freeze

    def self.call(file)
      last_data_file = find_last_data_file(file)

      unless last_data_file
        puts "No existing data file found for '#{file}'."
        exit 1
      end

      yaml = YAML.load_file(last_data_file)
      invoice_data = yaml['data']

      invoice_data['id'] += 1
      invoice_data['issue_date'] = increment_date(invoice_data['issue_date']) if invoice_data['issue_date']
      invoice_data['due_date'] = increment_date(invoice_data['due_date']) if invoice_data['due_date']

      invoice_data['items'].each do |item|
        item['description'] = increment_month_year(item['description']) if item['description']
      end

      next_file = "#{file}-#{invoice_data['id']}.yml"
      File.write(next_file, YAML.dump(yaml))

      open_in_editor(next_file)

      next_file
    end

    def self.find_last_data_file(file)
      Dir["#{file}-*.yml"].max_by { |f| f[/-(\d+)\.yml\z/, 1].to_i }
    end

    def self.increment_date(value)
      (Date.strptime(value, DATE_FORMAT) >> 1).strftime(DATE_FORMAT)
    end

    def self.increment_month_year(text)
      text.gsub(MONTH_YEAR_REGEX) do
        month_number = Date::ABBR_MONTHNAMES.index(Regexp.last_match(1))
        year = Regexp.last_match(2).to_i
        next_month = Date.new(year, month_number, 1) >> 1

        "#{Date::ABBR_MONTHNAMES[next_month.month]} #{next_month.year}"
      end
    end

    def self.open_in_editor(file)
      editor = ENV['EDITOR']
      return if editor.nil? || editor.empty?

      system(editor, file)
    end
  end
end
