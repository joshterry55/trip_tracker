class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :zip
      t.belongs_to :location

      t.timestamps
    end
  end
end
