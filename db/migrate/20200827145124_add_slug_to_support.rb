class AddSlugToSupport < ActiveRecord::Migration[6.0]
  def change
    add_column :supports, :slug, :string
    add_index :supports, :slug, unique: true
  end
end
