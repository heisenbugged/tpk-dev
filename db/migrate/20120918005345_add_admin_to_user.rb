class AddAdminToUser < ActiveRecord::Migration
  
  def change
    add_column :users, :admin, :boolean, 
                               :null => false, 
                               :default => false 
    User.create! do |r|
      r.email      = 'admin@technologypainkillers.com'
      r.password   = 'tpk-admin'
      r.admin = true
      r.confirmed_at = DateTime.now
    end
  end

  def down
    remove_column :users, :admin
    User.find_by_email('admin@technologypainkillers.com').try(:delete)
  end
end
