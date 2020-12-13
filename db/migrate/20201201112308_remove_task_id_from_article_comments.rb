class RemoveTaskIdFromArticleComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :article_comments, :task_id, :integer
  end
end
