class ChangeColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :availibility_id, :availability_id
  end
end
