class AddNamesToAirports < ActiveRecord::Migration[5.1]
  def change
    add_column :airports, :name, :string
  end
end
