class WeekAvailability < ActiveRecord::Base
  belongs_to :affiliate
  attr_accessible :friday, :monday, :saturday, :sunday, :sunday, :thursday, :tuesday, :wednesday
  
  def available? day
    day = day.downcase    
    return self[day]
  end
  
  def update_day day
    self[day] ? self[day] = false : self[day] = true
    save
  end
end
