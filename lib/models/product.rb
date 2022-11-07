require 'active_support/inflector'
require 'debug'
require_relative '../base'

class Product
  include Base
  attr_reader :quantity, :name, :category, :price, :taxeable, :imported

  TAX = 10
  IMPORT_TAX = 5

  TAX_FREE = %w[book food medical].freeze

  def initialize(quantity, name, price, imported)
    @quantity = quantity
    @price = price
    categorize(name)
    @imported = imported
  end

  def taxes
    return @taxes unless @taxes.nil?

    tax = 0
    tax += TAX if taxeable
    tax += IMPORT_TAX if imported
    parcial_tax = ((tax * price) / 100).round(2)
    parcial_tax = round_parcial(parcial_tax * 100)
    @taxes = (parcial_tax * quantity).round(2)
  end

  def total_price
    @total_price ||= ((quantity * price) + taxes).round(2)
  end

  def print_line
    add_item(quantity, is_quantity: true)
    add_item('imported') if imported
    add_item(name.gsub('_', ' '))
    @line += ':'
    add_item(total_price)
    puts "#{line}\n"
  end

  private

  def categorize(name)
    @name = name.split.map.with_index do |name_part, index|
      next name_part.singularize if index.zero?

      name_part
    end.join('_')
    $products_by_categories.each do |category, products|
      next unless products.include? @name

      @category = category
      break
    end
    @taxeable = !TAX_FREE.include?(category)
  end

  def round_parcial(tax)
    tax_arr = tax.to_i.digits
    if tax_arr[0] > 5
      tax_arr[0] = 0
      tax_arr[1] = tax_arr[1] + 1
    elsif tax_arr[0].positive?
      tax_arr[0] = 5
    else
      tax_arr[0] = 0
    end
    tax_arr.reverse.join.to_f / 100.0
  end

  def line
    @line ||= ''
  end

  def add_item(item, is_quantity: false)
    return @line = item if is_quantity

    @line = if item.is_a? String
              "#{line} #{item}"
            else
              format("#{line} %.2f", item)
            end
  end
end
