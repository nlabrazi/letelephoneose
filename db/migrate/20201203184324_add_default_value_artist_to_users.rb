class AddDefaultValueArtistToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_artist, :boolean, default: false, null: false
  end
end
