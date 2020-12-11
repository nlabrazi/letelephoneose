class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.boolean :is_shown
      t.belongs_to :user

      t.timestamps
    end
  end
end
