require 'json'
require_relative './models/cart'

class Main
  attr_reader :filepath

  def initialize(filepath)
    validate_initial_values(filepath)
    @filepath = filepath
    load_products
  end

  def run
    cart = Cart.new
    File.foreach(filepath) do |line|
      cart.add_product(line)
    end
    cart.print_sale
  end

  private

  def validate_initial_values(filepath)
    raise_attr_error 'filepath', filepath, 'a value string' unless filepath.is_a? String
    raise_method_error("file doesn't exist in the path", method_name: 'File.exists?') unless File.exist? filepath
  end

  def load_products
    file = File.open('./lib/products_by_categories.json')
    $products_by_categories = JSON.load file
    file.close
  end
end
