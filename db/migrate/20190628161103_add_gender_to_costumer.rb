class AddGenderToCostumer < ActiveRecord::Migration[5.2]
  def change
    add_column :costumers, :gender, :string
  end
end
