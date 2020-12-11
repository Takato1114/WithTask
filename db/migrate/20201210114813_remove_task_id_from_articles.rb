class RemoveTaskIdFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :articles, :task_id
    remove_reference :articles, :task_id
    remove_column :articles, :task_id, :integer
  end
end
