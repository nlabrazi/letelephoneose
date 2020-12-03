class Availability < ApplicationRecord
  belongs_to :artist
  has_one :order
  
  def slot
    duration = 15 * 60
    start_date = self.start_date
    end_date = start_date + duration
    flag = true
    while end_date <= self.end_date
      slot = Availability.new
      slot.artist_id = self.artist_id
      slot.start_date = start_date
      slot.end_date = end_date
      slot.is_booked = false
      flag = slot.save && flag
      start_date = end_date
      end_date += duration
    end
    return flag
  end
end
