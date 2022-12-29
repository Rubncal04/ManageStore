class NotNullOrderTypeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:orders, :order_type, false)
  end
end
