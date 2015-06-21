class CreateArticlemarks < ActiveRecord::Migration
  def change
    create_table :articlemarks do |t|
      t.belongs_to :user, index: true, foreign_key: false
      t.belongs_to :article, index: true, foreign_key: false
      t.integer :answered_counter
      t.boolean :important_flag

      t.timestamps null: false
    end
  end
end
