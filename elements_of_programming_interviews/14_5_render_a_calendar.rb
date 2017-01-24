class CalendarEvent
  attr_reader :start_time, :end_time

  def initialize(start_time, end_time)
    @start_time, @end_time = start_time, end_time
  end

  def to_s
    "#{@start_time}..#{@end_time}"
  end
end

class EndPoint
  attr_reader :time

  def initialize(time, start)
    @time = time
    @start = start
  end

  def start?
    @start
  end

  def end?
    !@start
  end

  def <=>(b)
    #If equal, favor start time
    if @time == b.time
      if start?
        return 1
      else
        return -1
      end
    end

    @time <=> b.time
  end

  def to_s
    s = ""
    if start?
      s << "start:"
    else
      s << "end:"
    end

     s << "#{@time}"
  end
end

#Determine the number of overlapping intervals.
#Runtime O(nlogn) Memory O(n) where duration of time in interval, and n is number of events
def number_of_overlaps(events)
  endpoints = []

  events.each do |e|
    endpoints << EndPoint.new(e.start_time, true)
    endpoints << EndPoint.new(e.end_time, false)
  end

  endpoints.sort!

  max_overlaps, current_overlaps = 0,0
  endpoints.each do |e|
    if e.start?
      current_overlaps += 1
    else
      current_overlaps -= 1
    end

    max_overlaps = [max_overlaps, current_overlaps].max
  end

  max_overlaps
end

events = []
events << CalendarEvent.new(1,5)
events << CalendarEvent.new(2,7)
events << CalendarEvent.new(4,5)
events << CalendarEvent.new(6,10)
events << CalendarEvent.new(8,9)
events << CalendarEvent.new(9,17)
events << CalendarEvent.new(11,13)
events << CalendarEvent.new(12,15)
events << CalendarEvent.new(14,15)

puts events
puts number_of_overlaps(events)
