# frozen_string_literal: true

module Clinvoice
  module RenderBasicInfo
    def self.call(pdf, data)
      Clinvoice::Helper.new_bold_line(pdf, "Invoice ID")
      Clinvoice::Helper.new_line(pdf, data.invoice_id)

      pdf.move_down 10

      Clinvoice::Helper.new_bold_line(pdf, "Currency")
      Clinvoice::Helper.new_line(pdf, data.currency)

      pdf.move_down 10

      if data.issue_date
        Clinvoice::Helper.new_bold_line(pdf, "Issue Date")
        Clinvoice::Helper.new_line(pdf, data.issue_date)

        pdf.move_down 10
      end

      if data.issue_date
        Clinvoice::Helper.new_bold_line(pdf, "Due Date")
        Clinvoice::Helper.new_line(pdf, data.due_date)

        pdf.move_down 10
      end
    end
  end
end
