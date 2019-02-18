# frozen_string_literal: true

module Clinvoice
  module RenderNameAndAddress
    def self.call(pdf, label, entity)
      pdf.font 'Helvetica', style: :bold
      pdf.text_box label, at: [8,  pdf.cursor]
      pdf.font 'Helvetica', style: :normal

      pdf.move_down 12
      pdf.text_box entity['name'], at: [8, pdf.cursor]
      pdf.move_down 12
      if entity['address']
        pdf.text_box entity['address']['line1'], at: [8, pdf.cursor]
        pdf.move_down 12
        pdf.text_box entity['address']['line2'], at: [8, pdf.cursor]
        pdf.move_down 12
      end

      pdf.move_down 10
    end
  end
end
