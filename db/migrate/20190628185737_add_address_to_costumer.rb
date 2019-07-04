class AddAddressToCostumer < ActiveRecord::Migration[5.2]
  def change
    add_column :costumers, :address, :string
  end
end
