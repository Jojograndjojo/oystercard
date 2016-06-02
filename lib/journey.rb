require_relative 'station'
class Journey

attr_reader :journey_log

  def initialize
    @journey_log = []
  end

MIN_FARE = -1

  def start(station = Station.new(" ",1))
    @journey_log << {:entry_station => @station = station}
  end

  def finish(station = Station.new(" ",1))
    @journey_log << {:exit_station => @station = station}
  end

  def fare
    MIN_FARE
  end

  def complete
    @journey_log[-1].keys != @journey_log[-2].keys
  end

end