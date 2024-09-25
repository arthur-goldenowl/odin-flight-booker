class CreatePassengers < ActiveRecord::Migration[7.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.integer :booking_id

      t.timestamps
    end
  end
end
