class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :availibility
      t.belongs_to :service
      t.string :target
      t.text :description

      t.timestamps
    end
  end
end
