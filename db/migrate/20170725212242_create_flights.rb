class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :departure_airport,  foreign_key: true
      t.references :arrival_airport,    foreign_key: true
      t.datetime :take_off
      t.time :duration

      t.timestamps
    end
  end
end
