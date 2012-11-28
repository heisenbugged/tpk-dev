class AddFieldsToCertificate < ActiveRecord::Migration
  def change
    add_column :certificates, :description, :text
    add_column :certificates, :approved, :boolean, :default => false
  end
end
