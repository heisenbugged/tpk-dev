class CreateItServices < ActiveRecord::Migration
  def change
    create_table :it_services do |t|
      t.string :service_name
      t.timestamps
    end
  end
end
