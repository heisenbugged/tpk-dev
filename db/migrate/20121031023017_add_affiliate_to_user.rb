class AddAffiliateToUser < ActiveRecord::Migration
  def change
    add_column :users, :affiliate_id, :integer
  end
end
