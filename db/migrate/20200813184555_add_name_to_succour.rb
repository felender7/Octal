class AddNameToSuccour < ActiveRecord::Migration[6.0]
  def change
    add_column :succours, :name, :string
  end
end
