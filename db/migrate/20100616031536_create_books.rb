class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :user, index: true, foreign_key: false, null: false
      t.string :name, null: false
      t.timestamps null: false

      t.index :name
    end
  end
end
