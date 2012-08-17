class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :prompt
      t.integer :assignment_id

      t.timestamps
    end
  end
end
