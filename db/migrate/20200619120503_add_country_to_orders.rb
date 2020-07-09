class AddCountryToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :country, :string
  end
end
