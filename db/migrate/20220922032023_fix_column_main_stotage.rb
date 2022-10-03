class FixColumnMainStotage < ActiveRecord::Migration[7.0]
  def change
    remove_columns :products, :main_stotage, :current_storage
  end
end
