# frozen_string_literal: true

module Clinvoice
  module RenderTotal
    def self.call(pdf, total)
      invoice_services_totals_data = [
        ['Total', Clinvoice::Helper.format_currency(total)]
      ]

      pdf.table(invoice_services_totals_data, position: 425, width: 115) do
        style(row(0), font_style: :bold)
        style(row(0), background_color: 'e9e9e9', border_color: 'dddddd', font_style: :bold)
        style(row(0..1).columns(0..1), padding: [3, 5, 3, 5], borders: [])
        style(column(1), align: :right)
      end

      pdf.move_down 25
    end
  end
end
