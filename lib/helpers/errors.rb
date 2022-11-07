module Helpers
  # Class that manage errors
  class Errors
    attr_reader :error_message

    def initialize(error_class_name)
      @error_message = "Error (#{error_class_name})"
    end

    def raise_attr_error(attr, value, expected)
      raise "#{error_message}: #{attr} received #{value}, but expected #{expected}"
    end

    def raise_method_error(method, message)
      raise_message = "#{error_message}: error in method #{method}"
      raise_message += ", #{message}" if message
      raise raise_message
    end
  end
end
