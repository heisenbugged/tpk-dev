class CreateServiceSets < ActiveRecord::Migration
  def change
    create_table :service_sets do |t|
      t.integer :affiliate_id
      t.integer :it_service_id
    end
  end
end
