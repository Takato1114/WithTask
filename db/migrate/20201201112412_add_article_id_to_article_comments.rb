class AddArticleIdToArticleComments < ActiveRecord::Migration[5.2]
  def change
    add_column :article_comments, :article_id, :integer
  end
end
