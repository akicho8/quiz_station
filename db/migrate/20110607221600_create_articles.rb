class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :question_body, null: false
      t.belongs_to :book, index: true, foreign_key: false, null: false
      t.timestamps null: false

      # t.index [:question_body, :book_id], :unique => true
    end
  end
end
