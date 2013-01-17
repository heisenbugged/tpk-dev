class AddVirtualAttributes < ActiveRecord::Migration
  def change
    add_column :skills, :is_virtual, :boolean, :default => false
    add_column :affiliates, :allows_virtual, :boolean, :default => false
  end
end
