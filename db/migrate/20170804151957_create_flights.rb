class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :number
      t.references :departure
      t.references :arrival
      t.datetime :departure_time

      t.timestamps
    end
  end
end
