# frozen_string_literal: true

require 'yaml'

module Clinvoice
  class Data
    attr_reader :invoice_id,
                :currency,
                :contractor,
                :client,
                :items,
                :notes,
                :total,
                :file

    def initialize(file)
      data = YAML.load_file("#{file}.yml")['data']

      @file = file
      @invoice_id = data['id']
      @currency = data['currency']
      @issue_date = data['issue_date']
      @contractor = data['contractor']
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
