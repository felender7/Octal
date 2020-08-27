class AddUserIdToSuccour < ActiveRecord::Migration[6.0]
  def change
    add_column :succours, :user_id, :integer
  end
end
