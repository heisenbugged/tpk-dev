class AddEmailToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :email, :string
  end
end
