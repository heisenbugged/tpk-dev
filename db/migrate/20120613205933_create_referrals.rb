class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :zip_code
      t.date :date_referred
      t.timestamp :time_referred

      t.timestamps
    end
  end
end
