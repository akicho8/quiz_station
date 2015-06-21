class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :question_body,                                       null: false
      t.integer :answered_counter,                                 null: false
      t.boolean :important_flag,                                   null: false
      t.belongs_to :article_group, index: true, foreign_key: false, null: false
      t.timestamps                                                 null: false

      t.index :important_flag
    end
  end
end
