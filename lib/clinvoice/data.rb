# frozen_string_literal: true

require 'yaml'

module Clinvoice
  class Data
    attr_reader :invoice_id,
                :issue_date,
                :due_date,
                :currency,
                :contractor,
                :client,
                :items,
                :notes,
                :total,
                :file

    def initialize(file)
      filename = file.end_with?('.yml') ? file : "#{file}.yml"

      data = YAML.load_file(filename)['data']

      @file = file
      @invoice_id = data['id']
      @currency = data['currency']
      @issue_date = data['issue_date']
      @contractor = data['contractor']
      @issue_date = data['issue_date']
      @due_date = data['due_date']
      @client = data['client']
      @items = data['items'].map do |item|
        [
          item['description'],
          item['unit_cost'],
          item['quantity'],
          item['quantity'] * item['unit_cost']
        ]
      end

      @notes = data['notes']
      @total = @items.map(&:last).sum
    end
  end
end
