class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string, default: "en attente", null: false
  end
end
