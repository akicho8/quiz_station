class CreateArticleGroups < ActiveRecord::Migration
  def change
    create_table :article_groups do |t|
      t.belongs_to :user, index: true, foreign_key: false
      t.string :name

      t.timestamps null: false
    end
  end
end
