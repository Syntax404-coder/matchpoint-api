# frozen_string_literal: true

module Types
  class FileType < Types::BaseScalar
    description "A valid file upload"

    def self.coerce_input(input_value, _context)
      # Rails sends ActionDispatch::Http::UploadedFile
      return input_value if input_value.is_a?(ActionDispatch::Http::UploadedFile) || input_value.is_a?(String)
      
      raise GraphQL::CoercionError, "#{input_value.inspect} is not a valid upload"
    end

    def self.coerce_result(ruby_value, _context)
      ruby_value.to_s
    end
  end
end
