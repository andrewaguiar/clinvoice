# frozen_string_literal: true

module Clinvoice
  module RenderTitle
    def self.call(pdf)
      pdf.move_down 5

      pdf.font 'Helvetica', style: :bold
      pdf.font_size 20
      pdf.text_box 'INVOICE', at: [230, pdf.cursor]
      pdf.font 'Helvetica', style: :normal

      pdf.move_down 30
    end
  end
end
