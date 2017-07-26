class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.datetime :take_off
      t.time :duration

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_index :flights, :departure_airport_id

    add_foreign_key :flights, :airports, column: :arrival_airport_id
    add_index :flights, :arrival_airport_id
  end
end
