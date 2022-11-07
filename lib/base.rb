require_relative 'helpers/errors'

# Base module with raise methods
module Base
  def raise_attr_error(attr, value, expected)
    raise_instance.raise_attr_error(attr, value, expected)
  end

  def raise_method_error(message = nil, method_name:)
    raise_instance.raise_method_error(method_name, message)
  end

  def raise_instance
    @raise_instance ||= Helpers::Errors.new(self.class)
  end
end
