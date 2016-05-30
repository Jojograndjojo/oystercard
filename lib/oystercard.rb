class Oystercard

  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance can not exceed £#{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
  	@balance += amount
  end

end