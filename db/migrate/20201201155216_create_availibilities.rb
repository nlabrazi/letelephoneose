class CreateAvailibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availibilities do |t|
      t.belongs_to :artist
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_booked

      t.timestamps
    end
  end
end
