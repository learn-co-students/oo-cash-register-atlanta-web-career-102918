require 'pry'

class CashRegister

  attr_accessor :total

  attr_reader :discount
  #optionally take an employee discount on initialization
  def initialize(discount = nil)
    #set instance variable @total on initialize to 0
    @total = 0
    @products = []

    if !(discount == nil)
      @discount = discount
    end
  end

  def add_item(title, price, quantity = nil)
    @title = title
    # for each add_item, add a hash to the products array
    item = {}
    # whenever an item is added, we also want to save the "title" to an array
    # if there are more than one item (quantity is > 1), add that many items
    if !(quantity == nil)
      quantity.times do |title|
        @total += price
        item[@title] = price
        @products << item
      end
    # if there is only one item (quantity == 0), just add the title once
    else
      item[@title] = price
      @products << item
      @total += price
    end

  end

  def apply_discount
    if !(discount == nil)
      @total = @total * (1 - (discount * 0.01))
      "After the discount, the total comes to $#{@total.floor}."
    else
      "There is no discount to apply."
    end
  end

  def items
    # result should be an array. Each element in the array should be a string.
    # each string should be the element title.
    temp = @products.map do |item|
      item.map do |title, price|
        title
      end
    end
    temp.flatten
  end

  def void_last_transaction
    #reduce @total by price of last item that was added
    subtract_from_total = @products.pop
    @products
    @total -= subtract_from_total.values[0]
    @total
  end
end
