class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :question_body
      t.text :answer_body
      t.integer :difficult_level
      t.integer :display_counter
      t.timestamps :null => false

      t.index :difficult_level
    end
  end
end
