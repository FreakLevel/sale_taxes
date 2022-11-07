require 'active_support/inflector'
require 'debug'
require_relative '../base'
require_relative 'product'

class Cart
  include Base
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_product(product)
    quantity = product[/\d+/].to_i
    price = product.split[-1].to_f
    imported = product.include? 'imported'
    name = name_product(product)
    @products << Product.new(quantity, name, price, imported)
  end

  def total_tax
    @total_tax ||= products.reduce(0) { |total, product| (total + product.taxes).round(2) }
  end

  def total
    @total ||= products.reduce(0) { |total, product| total + product.total_price }
  end

  def print_sale
    products.each(&:print_line)
    puts format "Sales Taxes: %.2f\n", total_tax
    puts format "Total: %.2f\n", total
  end

  private

  def name_product(product)
    product.gsub!(/(\d+\.?)|(\b(imported)\b)|(\bat\b)/, '').strip
  end
end
