class RemoveTaskNameTaskSummaryDeadlineScheduledTimeActualTimeFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :task_name, :string
    remove_column :tasks, :task_summary, :text
    remove_column :tasks, :deadline, :date
    remove_column :tasks, :scheduled_time, :integer
    remove_column :tasks, :actual_time, :integer
  end
end
