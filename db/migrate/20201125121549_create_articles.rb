class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false
      t.text :explanation, null: false
      t.integer :genre, default: 0, null: false
      t.text :reference_url
      t.timestamps
    end
  end
end
