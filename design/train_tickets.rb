class Customer
  def browse_schedules(origin, destination, departure_datetime)
    @schedules = ScheduleFinder::find(origin, destination, departure_datetime)
  end

  def buy_ticket(origin, destination, departure_datetime)
    #
  end
end

class ScheduleFinder
  def find(origin, destination, departure_datetime)
    #finds schedules with origin, destination, and within 1 hour of departure_datetime
  end
end

class Schedule
  attr_reader :stops
end

def Stop
  attr_reader :station, :arrival_time, :departure_time
end

class TicketProcessor
  def initialize(origin, destination, datetime)
    origin, destination,
    @fare = Fare.new
  end

  def payfare
end

class PaymentDetails
end

class Fare
  attr_reader :fare_amount

  def initialize()
    @fare_amount = 7.00
  end
end

class Ticket
  attr_reader :origin, :destination, :fare, :purchase_datetime
end


