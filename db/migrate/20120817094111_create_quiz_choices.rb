class CreateQuizChoices < ActiveRecord::Migration
  def change
    create_table :quiz_choices do |t|
      t.integer :quiz_id
      t.string :choice_letter
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
