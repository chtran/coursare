class CreateCourseSubscriptions < ActiveRecord::Migration
  def change
    create_table :course_subscriptions do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
