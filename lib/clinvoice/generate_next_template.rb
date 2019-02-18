# frozen_string_literal: true

module Clinvoice
  module GenerateNextTemplate
    def self.call(file)
      last_data_file = Dir["#{file}-*.yml"].max
      template_content = File.read(last_data_file)

      next_id = template_content.scan(/id: (\d*)/).first.first.to_i + 1

      next_template_content = template_content.sub(/id: (\d*)/, "id: #{next_id}")

      File.write("#{file}-#{next_id}.yml", next_template_content)
    end
  end
end
