class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string :subject
      t.text :message
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
