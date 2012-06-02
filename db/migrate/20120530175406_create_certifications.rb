class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :cert_name
      t.integer :affiliate_id
      t.timestamps
    end
  end
end
