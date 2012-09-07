class CreateItServices < ActiveRecord::Migration
  def change
    create_table :it_services do |t|
      t.string :name
      t.timestamps
    end
  end
end
