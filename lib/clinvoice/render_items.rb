# frozen_string_literal: true

module Clinvoice
  module RenderItems
    def self.call(pdf, items)
      pdf.move_down 20

      header = ['Description', 'Unit Cost', 'Quantity', 'Line Total']
      blank_line = [' ', ' ', ' ', ' ']

      formatted_items = items.map do |item|
        [
          item[0],
          Clinvoice::Helper.format_currency(item[1]),
          item[2],
          Clinvoice::Helper.format_currency(item[3])
        ]
      end

      rows = [header] + formatted_items + [blank_line]

      pdf.table(rows, width: pdf.bounds.width) do
        style(row(1..-1).columns(0..-1), padding: [4, 5, 4, 5], borders: [:bottom], border_color: 'dddddd')
        style(row(0), background_color: 'e9e9e9', border_color: 'dddddd', font_style: :bold)
        style(row(0).columns(0..-1), borders: %i[top bottom])
        style(row(0).columns(0), borders: %i[top left bottom])
        style(row(0).columns(-1), borders: %i[top right bottom])
        style(row(-1), border_width: 2)
        style(column(2..-1), align: :right)
        style(columns(0), width: 280)
      end

      pdf.move_down 10
    end
  end
end
