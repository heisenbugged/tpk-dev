class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :cert_name

      t.timestamps
    end
  end
end
