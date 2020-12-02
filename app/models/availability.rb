class Availability < ApplicationRecord
  belongs_to :artist
  has_one :order

  def creating_slots(avail_params, artist_id)
  	
    duration = 15 * 60
    i = true
    
    start_date = avail_params{:start_date}
    
    while (start_date < avail_params{:end_date})
      slot = Availability.new
      slot.artist_id = artist_id
      slot.is_booked = false
      slot.start_date = start_date
      slot.end_date = start_date + duration - 1
      puts 'tout va bien'
      i = slot.save && i

      start_date = slot.end_date + 1 
    end
    
    return i
  end
  
end
