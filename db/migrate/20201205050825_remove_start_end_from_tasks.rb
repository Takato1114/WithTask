class RemoveStartEndFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :start_end, :date
  end
end
