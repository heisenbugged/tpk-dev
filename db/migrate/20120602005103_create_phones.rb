class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :ph_type

      t.references :phoneable, :polymorphic => true
      t.timestamps
    end
  end
end
