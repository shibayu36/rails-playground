class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :diary, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body

      t.timestamps
    end
  end
end
