class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
