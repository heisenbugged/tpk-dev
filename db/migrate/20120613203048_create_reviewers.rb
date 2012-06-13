class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.string :name
      t.string :email_address
      t.boolean :verified

      t.timestamps
    end
  end
end
