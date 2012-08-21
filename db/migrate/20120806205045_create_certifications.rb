class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.integer :affiliate_id
      t.integer :certificate_id
    end
  end
end
