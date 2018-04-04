class CashRegister
  attr_accessor :total, :discount, :cart, :items

  def initialize(discount = 0)
    @total = 0
    @items = []
    @cart = []
    @discount = discount
  end

  def add_item(item, price, quantity = 1)
    @cart << [item, price, quantity]
    @items += [item] * quantity
    @total += price * quantity
  end

  def apply_discount
    if @discount > 0 && !@cart.empty?
      price = @cart.last[1]
      quantity = @cart.last[2]
      @total -= price * quantity * (discount / 100.0)

      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @cart.last[1] * @cart.last[2] * (1 - @discount/100.0)
    @items.slice!(-@cart.last[2]..-1)
    @cart.pop
  end
end
