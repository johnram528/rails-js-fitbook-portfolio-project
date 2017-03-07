class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :name
      t.integer :estimated_time
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :routines, :user_id
  end
end
