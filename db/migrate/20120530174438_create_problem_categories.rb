class CreateProblemCategories < ActiveRecord::Migration
  def change
    create_table :problem_categories do |t|
      t.string :category_name

      t.timestamps
    end
  end
end
