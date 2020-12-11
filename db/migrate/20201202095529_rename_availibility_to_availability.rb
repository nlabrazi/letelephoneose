class RenameAvailibilityToAvailability < ActiveRecord::Migration[6.0]
  def change
  	rename_table :availibilities, :availabilities
  end
end