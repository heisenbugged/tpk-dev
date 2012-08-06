class CreateAffiliatesItServicesJoinTable < ActiveRecord::Migration
  def change
    create_table :affiliates_it_services, :id => false do |t|
      t.integer :affiliate_id
      t.integer :it_service_id
    end    
  end
end
