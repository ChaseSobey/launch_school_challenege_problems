require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(25)
  end
  
  def test_accept_money
     @transaction.amount_paid = 25
     
     previous_amount = @cash_register.total_money
     @cash_register.accept_money(@transaction)
     current_amount = @cash_register.total_money
     
     assert_equal(previous_amount + 25, current_amount)
  end
  
  def test_change
    @transaction.amount_paid = 30
    
    assert_equal(5, @cash_register.change(@transaction))
  end
  
  def test_give_receipt
    assert_output("You've paid $25.\n") { @cash_register.give_receipt(@transaction) }
  end
  
end