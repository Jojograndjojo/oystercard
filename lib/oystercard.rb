require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_log

  MAX_LIMIT = 90
  MIN_BALANCE = 1


  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    fail "Balance can not exceed £#{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
  	@balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance." if balance < MIN_BALANCE
   	@journey.start(station)
  end

  def touch_out(station)
  	@journey.finish(station)
    deduct
  end

private

 def deduct
    @balance -= @journey.fare
  end

end
