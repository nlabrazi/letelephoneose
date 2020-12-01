class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :is_admin
      t.boolean :is_artist

      t.timestamps
    end
  end
end
