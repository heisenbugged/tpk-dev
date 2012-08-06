class CreateAffiliatesCertificationsJoinTable < ActiveRecord::Migration
  def change
    create_table :affiliates_certifications, :id => false do |t|
      t.integer :affiliate_id
      t.integer :certification_id
    end    
  end
end
