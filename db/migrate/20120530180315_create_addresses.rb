class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_line_1
      t.string :street_line_2
      t.string :city
      t.string :state
      t.integer :zip
      
      # geocoding
      t.float :latitude
      t.float :longitude

      t.references :addressable, :polymorphic => true

      t.timestamps
    end
  end
end
