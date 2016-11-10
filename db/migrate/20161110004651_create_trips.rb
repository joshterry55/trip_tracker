class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :date
      t.text :friends

      t.timestamps
    end
  end
end
