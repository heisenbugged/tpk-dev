class AddAdminToUser < ActiveRecord::Migration
    add_column :users, :admin, :boolean, 
                               :null => false, 
                               :default => false 
    User.create! do |r|
      r.email      = 'admin@technologypainkillers.com'
      r.password   = 'tpk-admin'
      r.admin = true
    end
  end

  def down
    remove_column :users, :admin
    User.find_by_email('admin@technologypainkillers.com').try(:delete)
  en
end
