class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :question_body
      t.text :answer_body
      t.timestamps :null => false
    end
  end
end
