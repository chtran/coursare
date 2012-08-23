class AddReleaseDateToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :release_date, :time
  end
end
