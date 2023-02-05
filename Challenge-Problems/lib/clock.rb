class Clock
  attr_accessor :hour_hand, :minute_hand
  def initialize(hour, minute = 0)
    @hour_hand = hour
    @minute_hand = minute
  end
  
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end
  
  def +(minutes)
   final_minutes = (minute_hand + minutes) % 60
   added_hours = (minute_hand + minutes) / 60
   
   final_hours = (hour_hand + added_hours) % 24
   
   Clock.new(final_hours, final_minutes)
  end
  
  def -(minutes)
    total_minutes = minutes_since_midnight - minutes
    while total_minutes < 0
      total_minutes += (24*60)
    end
    
    final_hours = total_minutes / 60
    final_minutes = total_minutes % 60
    
    
    Clock.new(final_hours, final_minutes)
  end
  
  def minutes_since_midnight
    60 * hour_hand + minute_hand
  end
    
  
  def to_s
    hour_time = hour_hand.to_s
    hour_time.prepend('0') if hour_hand < 10
    minute_time = minute_hand.to_s
    minute_time.prepend('0') if minute_hand < 10
    
    hour_time + ':' + minute_time
  end
  
  def ==(other)
    (self.hour_hand == other.hour_hand) && (self.minute_hand == other.minute_hand)
  end
end
