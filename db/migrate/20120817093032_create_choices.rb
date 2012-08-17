class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :choice_letter
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
