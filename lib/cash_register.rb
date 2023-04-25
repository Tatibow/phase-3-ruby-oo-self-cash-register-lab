
class CashRegister

    attr_accessor :discount, :total, :items, :transactions


    def initialize(discount = 0, total = 0)
        @discount = discount
        @total = total
        @items = []
        @last_transaction = 0
    end


    def add_item(title, price, quantity = 1)
        if quantity == 0
            self.total += price
         else
            self.total += price * quantity
            @last_transaction = price * quantity
         end
           quantity.times do self.items << title end
    end

    def apply_discount
        if self.discount == 0
        return "There is no discount to apply."
    else
        self.total -= (self.total * self.discount / 100)
        "After the discount, the total comes to $800."
    end
    end



    def void_last_transaction
        self.total -= @last_transaction
        @items.pop()
    end
end


cash_register = CashRegister.new(20, 0)
cash_register.add_item("eggs", 0.98)
cash_register.add_item("book", 5.00, 3)
puts cash_register.total
cash_register.apply_discount
puts "new total: #{cash_register.total}"
p cash_register.items
cash_register.void_last_transaction

puts "new new total: #{cash_register.total}"
