class AddFieldsToProblemDetail < ActiveRecord::Migration
  def change
    add_column :problem_details, :description, :text
    add_column :problem_details, :approved, :boolean, :default => true
  end
end
