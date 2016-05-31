class Oystercard

  attr_reader :balance

  MAX_LIMIT = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance can not exceed £#{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
  	@balance += amount
  end

  def touch_in
    fail "Insufficient balance." if balance < MIN_BALANCE
    @in_journey = true
  end

  def in_journey?
    @in_journey ? true : false
  end

  def touch_out
    @in_journey = false
    deduct
  end

private

 def deduct
    @balance -= MIN_FARE
  end

end