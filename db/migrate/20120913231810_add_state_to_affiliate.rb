class AddStateToAffiliate < ActiveRecord::Migration
  def change
    add_column :affiliates, :state, :string, :default => "active"
  end
end
