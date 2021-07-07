require "pry"

class CashRegister
  attr_accessor :total, :discount, :most_recent_price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @most_recent_item = nil
  end

  def  add_item(title, price, quantity = 1)
    quantity.times {@items << title}
    @total += price * quantity
    @most_recent_price = price
  end

  def apply_discount
    ### why does discount += 100 not work
    ## which is preferable self.discount /= 100 or @ discount?????
    #ternary
    if self.discount == 0
      return "There is no discount to apply."
    end
    self.total = self.total - (self.discount.to_f / 100 * self.total.to_f)
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    self.total -= @most_recent_price
  end
end
