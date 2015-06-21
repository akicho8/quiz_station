class CreateAnswerLogs < ActiveRecord::Migration
  def change
    create_table :answer_logs do |t|
      t.belongs_to :user, index: true, foreign_key: false, null: false
      t.belongs_to :article, index: true, foreign_key: false, null: false
      t.string :column_dummy1

      t.timestamps null: false
    end
  end
end
