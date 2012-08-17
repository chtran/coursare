class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.text :prompt
      t.integer :video_id

      t.timestamps
    end
  end
end
