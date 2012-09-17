class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.integer :affiliate_id
      t.integer :certificate_id
    end
    add_index :certifications, :affiliate_id
    add_index :certifications, :certificate_id
  end
end
