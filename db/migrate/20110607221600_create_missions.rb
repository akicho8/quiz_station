class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :question_body, :null => false
      t.text :answer_body, :null => false
      t.integer :difficult_level, :null => false
      t.integer :display_counter, :null => false
      t.integer :foobar_counter, :null => false
      t.boolean :foobar_flag, :null => false
      t.timestamps :null => false

      t.index :difficult_level
      t.index :foobar_flag
    end
  end
end
