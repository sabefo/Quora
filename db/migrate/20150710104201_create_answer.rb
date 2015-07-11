class CreateAnswer < ActiveRecord::Migration
  def change
		create_table :answers do  |t|
			t.string :answers
			t.integer :respond_id
			t.integer :question_id

			t.timestamps
		end
  end
end
