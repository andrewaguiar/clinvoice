# frozen_string_literal: true

module Clinvoice
  module RenderTotal
    def self.call(pdf, total)
      pdf.table(items(total), position: 425, width: 115) do
        style(row(0), font_style: :bold)
        style(row(0), background_color: 'e9e9e9', border_color: 'dddddd', font_style: :bold)
        style(column(1), align: :right)
        style(row(0..1).columns(0..1), padding: [3, 5, 3, 5], borders: [])
      end

      pdf.move_down 25
    end

    private

    def self.items(total)
      [['Total', Clinvoice::Helper.format_currency(total)]]
    end
  end
end
