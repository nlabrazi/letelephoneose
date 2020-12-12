class Availability < ApplicationRecord
  belongs_to :artist
  has_one :order



  validate :start_date_cannot_be_in_the_past,
           :end_date_cannot_be_in_the_past,
           :no_duplicate_availability, on: :create

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < DateTime.now
      errors.add(:start_date, "Choisir une date dans le futur")
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < DateTime.now
      errors.add(:end_date, "Choisir une date dans le futur")
    end
  end

  def no_duplicate_availability
    self.artist.availabilities.each do |t|
      if start_date.between?(t.start_date,t.start_date)
        errors.add(:start_date, message: "Deja presente")
      elsif end_date.between?(t.start_date,t.start_date)
        t.errors.add(:end_date, message: "Deja presente")
      end
    end
  end

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
      if !flag
        self.errors.add(:start_date, slot.errors.messages.first)
      end
      start_date = end_date
      end_date += duration
    end
    return flag
  end
end
