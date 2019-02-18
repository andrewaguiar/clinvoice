# frozen_string_literal: true

module Clinvoice
  module Helper
    def self.format_currency(number)
      format('$%.2f', number.to_f)
    end
  end
end
