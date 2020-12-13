class RemoveTaskIdFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :task_id, :integer
  end
end
