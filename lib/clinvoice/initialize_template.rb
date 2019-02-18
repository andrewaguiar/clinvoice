# frozen_string_literal: true

module Clinvoice
  module InitializeTemplate
    def self.call(file)
      template_content = <<~TEMPLATE
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
      TEMPLATE

      File.write("#{file}-1.yml", template_content)
    end
  end
end
