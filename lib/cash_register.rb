class CashRegister
  attr_accessor :total, :discount 

  def initialize(discount = nil, total = 0)
    @total = total
    @discount = discount
    @items = [] 
  end

  def add_item(title, price, quauntity = nil)
    if quauntity
      quauntity.times do
        item = { title: title, price: price }
        @items << item
      end
      @total = price * quauntity + self.total
    else
      @items << { title: title, price: price }
      @total = price + self.total 
    end 
  end

  def apply_discount
    return "There is no discount to apply." unless self.discount
    discounted_price = self.total * (self.discount.to_f / 100.to_f)
    discounted_price_to_integer = discounted_price.to_i
    @total = self.total - discounted_price_to_integer 
    message = "After the discount, the total comes to $#{@total}."
  end

  def items
    @items.collect do |item|  
      item[:title]
    end
  end

  def void_last_transaction 
    @total -= @items.last[:price]
    @items.pop # removes last item from items instance variable
  end

  # private

  # def remove_last_transaction_item
  #   @items.pop
  # end
end

