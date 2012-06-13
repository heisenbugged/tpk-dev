class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.date :date
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
