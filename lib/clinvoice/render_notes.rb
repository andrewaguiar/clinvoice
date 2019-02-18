# frozen_string_literal: true

module Clinvoice
  module RenderNotes
    def self.call(pdf, notes)
      return unless notes

      pdf.table([['Notes'], [notes]], width: 275) do
        style(row(0..-1).columns(0..-1), padding: [1, 0, 1, 0], borders: [])
        style(row(0).columns(0), font_style: :bold)
      end
    end
  end
end
