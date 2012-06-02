class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :company_name
      t.boolean :bonded

      t.timestamps
    end
  end
end
