require_relative 'station'
class Journey

attr_reader :journey_log
MIN_FARE = 1
PENALTY = 6

  def initialize
    @journey_log = []
  end

  def start(station = Station.new(" ",1))
    @journey_log << {:entry_station => @station = station}
  end

  def finish(station = Station.new(" ",1))
    @journey_log << {:exit_station => @station = station}
  end

  def fare
    complete ? MIN_FARE : (MIN_FARE + PENALTY)
  end

  def complete
     (@journey_log.length)<2 && (journey_log[0].keys != :exit_station) ? false : (@journey_log[-1].keys != @journey_log[-2].keys)
  end


end