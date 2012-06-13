class CreateProblemDetails < ActiveRecord::Migration
  def change
    create_table :problem_details do |t|
      t.string :name

      t.timestamps
    end
  end
end
