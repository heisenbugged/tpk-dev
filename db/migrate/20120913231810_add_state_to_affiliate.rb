class AddStateToAffiliate < ActiveRecord::Migration
  def change
    add_column :affiliates, :state, :string, :default => "active"
    add_index :affiliates, :state
  end
end
