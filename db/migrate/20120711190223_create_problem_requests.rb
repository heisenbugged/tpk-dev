class CreateProblemRequests < ActiveRecord::Migration
  def change
    create_table :problem_requests do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.integer :zip            
      t.text :description
      
      # geocoding
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
