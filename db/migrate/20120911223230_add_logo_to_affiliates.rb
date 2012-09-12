class AddLogoToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :logo, :string
  end
end
