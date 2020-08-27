class CreateSuccours < ActiveRecord::Migration[6.0]
  def change
    create_table :succours do |t|
      t.string :task
      t.string :level
      t.string :course
      t.text :question
      t.text :code
      t.string :slug

      t.timestamps
    end
    add_index :succours, :slug, unique: true
  end
end
