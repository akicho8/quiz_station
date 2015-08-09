class CreateHideMarks < ActiveRecord::Migration
  def change
    create_table :hide_marks do |t|
      t.belongs_to :user, index: true, foreign_key: false, null: false
      t.belongs_to :article, index: true, foreign_key: false, null: false
      t.timestamps null: false
    end
  end
end
