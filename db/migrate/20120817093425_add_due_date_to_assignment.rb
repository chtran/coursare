class AddDueDateToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :due_date, :time
  end
end
