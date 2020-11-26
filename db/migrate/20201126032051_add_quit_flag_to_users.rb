class AddQuitFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :quit_flag, :boolean, default: false
  end
end
