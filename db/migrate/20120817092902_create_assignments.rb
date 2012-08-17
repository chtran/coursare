class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :lesson_id
      t.string :title

      t.timestamps
    end
  end
end
