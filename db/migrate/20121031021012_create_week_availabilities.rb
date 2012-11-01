class CreateWeekAvailabilities < ActiveRecord::Migration
  def change
    create_table :week_availabilities do |t|
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      
      
      t.references :affiliate
      
      t.timestamps
    end
  end
end
