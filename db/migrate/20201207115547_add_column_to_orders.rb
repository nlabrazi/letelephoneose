class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string, default: "unpaid", null: false
  end
end
