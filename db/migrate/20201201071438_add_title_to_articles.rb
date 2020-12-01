class AddTitleToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :title, :integer, null: false, default: 1
    change_column_default :articles, :title, nil
  end
end
