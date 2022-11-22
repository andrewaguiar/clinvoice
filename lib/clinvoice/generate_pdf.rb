# frozen_string_literal: true

require 'prawn'
require 'prawn/table'
require 'clinvoice/data'
require 'clinvoice/helper'
require 'clinvoice/render_basic_info'
require 'clinvoice/render_name_and_address'
require 'clinvoice/render_items'
require 'clinvoice/render_notes'
require 'clinvoice/render_title'
require 'clinvoice/render_total'

module Clinvoice
  module GeneratePDF
    def self.call(file)
      data = Clinvoice::Data.new(file)

      Prawn::Document.generate(data.pdf_file) do |pdf|
        Prawn::Font::AFM.hide_m17n_warning = true

        pdf.font 'Helvetica'

        Clinvoice::RenderTitle.call(pdf)

        pdf.font_size 9

        Clinvoice::RenderBasicInfo.call(pdf, data)
        Clinvoice::RenderNameAndAddress.call(pdf, 'From', data.contractor)
        Clinvoice::RenderNameAndAddress.call(pdf, 'To', data.client)
        Clinvoice::RenderItems.call(pdf, data.items)
        Clinvoice::RenderTotal.call(pdf, data.total)
        Clinvoice::RenderNotes.call(pdf, data.notes)
      end
    end
  end
end
