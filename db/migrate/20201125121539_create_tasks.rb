class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :task_name, null: false
      t.text :task_summary
      t.date :deadline
      t.integer :scheduled_time
      t.integer :actual_time
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
