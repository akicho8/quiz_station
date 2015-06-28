class CreateAnswerLogs < ActiveRecord::Migration
  def change
    create_table :answer_logs do |t|
      t.belongs_to :user, index: true, foreign_key: false, null: false
      t.belongs_to :article, index: true, foreign_key: false, null: false
      t.timestamps null: false
    end
  end
end
