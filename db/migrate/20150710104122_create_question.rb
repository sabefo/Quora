class CreateQuestion < ActiveRecord::Migration
  def change
		create_table :questions do  |t|
			t.string :question
			t.string :author_id
		
			t.timestamps
		end
  end
end
