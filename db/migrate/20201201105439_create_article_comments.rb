class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
