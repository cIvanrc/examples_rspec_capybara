class AddColumnsToCostumer < ActiveRecord::Migration[5.2]
  def change
    add_column :costumers, :vip, :boolean
    add_column :costumers, :days_to_pay, :integer
  end
end
