class RemoveLessonIdFromAssignment < ActiveRecord::Migration
  def up
    remove_column :assignments, :lesson_id
  end

  def down
  end
end
