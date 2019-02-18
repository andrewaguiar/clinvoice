# frozen_string_literal: true

module Clinvoice
  module RenderNameAndAddress
    def self.call(pdf, label, entity)
      Clinvoice::Helper.new_bold_line(pdf, label)
      Clinvoice::Helper.new_line(pdf, entity['name'])

      if entity['address']
        Clinvoice::Helper.new_line(pdf, entity['address']['line1'])
        Clinvoice::Helper.new_line(pdf, entity['address']['line2'])
      end

      pdf.move_down 10
    end
  end
end
