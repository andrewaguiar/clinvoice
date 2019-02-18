# frozen_string_literal: true

module Clinvoice
  module Helper
    def self.format_currency(number)
      format('$%.2f', number.to_f)
    end

    def self.new_line(pdf, text)
      pdf.text_box text.to_s, at: [8, pdf.cursor]
      pdf.move_down 12
    end

    def self.new_bold_line(pdf, text)
      pdf.font 'Helvetica', style: :bold
      pdf.text_box text.to_s, at: [8,  pdf.cursor]
      pdf.font 'Helvetica', style: :normal
      pdf.move_down 12
    end
  end
end
